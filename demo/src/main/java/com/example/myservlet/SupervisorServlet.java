package com.example.myservlet;

import com.example.dao.UsersDao;
import com.example.dao.impl.TeachersDaoImpl;
import com.example.dao.impl.UsersDaoImpl;
import com.example.entity.Teacher;
import com.example.dao.TeachersDao;
import com.example.entity.User;
import com.example.entity.UserType;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/dataFetch")
public class SupervisorServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Step 1: 获取所有 deptId
            String deptIdsUrl = "http://homepage.hit.edu.cn/sysBrowseShow/executeBrowseAllOfSchoolDepart.do";
            Map<String, List<String>> deptUserInfoMap = new HashMap<>();
            List<String> deptIds = getDeptIds(deptIdsUrl);

            // Step 2: 对每个 deptId 发送请求并保存用户信息
            for (String deptId : deptIds) {
                List<String> userInfoList = getUserInfoByDeptId(deptId);
                deptUserInfoMap.put(deptId, userInfoList);
            }

            // 计数器，用于分配 userID 和 teacherID
            int userIDCounter = 1;
            int teacherIDCounter = 1;

            // 输出保存的用户信息
            for (Map.Entry<String, List<String>> entry : deptUserInfoMap.entrySet()) {
                String deptId = entry.getKey();
                List<String> userInfoList = entry.getValue();

                for (String userInfo : userInfoList) {
                    String userDetail = getUserDetail(userInfo);

                    String name = extractName(userDetail);
                    String email = reverseString(extractEmail(userDetail));
                    String discipline = extractDiscipline(userDetail);
                    String phone = extractPhone(userDetail); // 添加从 HTML 中提取电话号码的方法

                    // 检查四个信息是否都不为空
                    if (name != null && !name.isEmpty() &&
                            email != null && !email.isEmpty() &&
                            discipline != null && !discipline.isEmpty() &&
                            phone != null && !phone.isEmpty()) {

                        // 创建 User 对象
                        User user = new User();
                        // 检查并设置唯一的 userID
                        while (true) {
                            user.setUserID(userIDCounter);
                            UsersDao usersDao = new UsersDaoImpl();
                            if (usersDao.getUserById(userIDCounter) == null) {
                                break; // 如果不存在相同的 userID，跳出循环
                            }
                            userIDCounter++; // 否则递增 userIDCounter
                        }
                        user.setUsername(email); // 使用邮箱作为用户名
                        user.setPassword(email); // 使用邮箱作为密码，可以根据需求生成随机密码
                        user.setUserType(UserType.Teacher); // 设置用户类型为老师

                        // 保存 User 对象到数据库
                        UsersDao usersDao = new UsersDaoImpl();
                        int result = usersDao.createUser(user);

                        if (result > 0) {
                            // 创建 Teacher 对象
                            Teacher teacher = new Teacher();
                            while (true) {
                                teacher.setTeacherID(teacherIDCounter);
                                TeachersDao teachersDao = new TeachersDaoImpl();
                                if (teachersDao.getTeacherById(teacherIDCounter) == null) {
                                    break; // 如果不存在相同的 userID，跳出循环
                                }
                                teacherIDCounter++; // 否则递增 userIDCounter
                            }
                            teacher.setUserID(user.getUserID());
                            teacher.setName(name);
                            teacher.setEmail(email);
                            teacher.setProfession(discipline);
                            teacher.setBio(phone);

                            // 保存 Teacher 对象到数据库
                            TeachersDao teachersDao = new TeachersDaoImpl();
                            teachersDao.saveTeacher(teacher);

                        } else {

                        }
                    } else {

                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }






    private static String reverseString(String str) {
        StringBuilder sb = new StringBuilder(str);
        return sb.reverse().toString();
    }

    // 获取所有 deptId
    public static List<String> getDeptIds(String url) throws Exception {
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Accept", "application/json, text/javascript, */*; q=0.01");
        con.setRequestProperty("Accept-Encoding", "gzip, deflate");
        con.setRequestProperty("Accept-Language", "zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2");
        con.setRequestProperty("Connection", "keep-alive");
        con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        con.setRequestProperty("Cookie", "JSESSIONID=53015FACCE2C3F936F8BC2D57147BBD1");
        con.setRequestProperty("Host", "homepage.hit.edu.cn");
        con.setRequestProperty("Origin", "http://homepage.hit.edu.cn");
        con.setRequestProperty("Referer", "http://homepage.hit.edu.cn/school-dept?id=1&browseName=%25E6%25A0%25A1%25E5%2586%2585%25E5%258D%2595%25E4%25BD%258D&browseEnName=DEPARTMENT");
        con.setRequestProperty("User-Agent", "Mozilla/5.0");
        con.setRequestProperty("X-Requested-With", "XMLHttpRequest");

        con.setDoOutput(true);
        String postParams = "";
        try (OutputStream os = con.getOutputStream()) {
            byte[] input = postParams.getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        int responseCode = con.getResponseCode();
        List<String> deptIds = new ArrayList<>();

        if (responseCode == HttpURLConnection.HTTP_OK) {
            try (BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()))) {
                String inputLine;
                StringBuilder response = new StringBuilder();

                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                // 解析JSON响应
                JSONObject jsonResponse = new JSONObject(response.toString());
                JSONArray deptList = jsonResponse.getJSONArray("list");
                for (int i = 0; i < deptList.length(); i++) {
                    JSONObject dept = deptList.getJSONObject(i);
                    deptIds.add(dept.getString("id"));
                }
            }
        } else {
            System.out.println("POST 请求未成功");
        }

        return deptIds;
    }

    // 根据 deptId 获取用户信息
    public static List<String> getUserInfoByDeptId(String deptId) throws Exception {
        String url = "http://homepage.hit.edu.cn/sysBrowseShow/getUserInfoByDeptId.do";
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();

        // 设置基本的POST请求
        con.setRequestMethod("POST");
        con.setRequestProperty("Accept", "application/json, text/javascript, */*; q=0.01");
        con.setRequestProperty("Accept-Encoding", "gzip, deflate");
        con.setRequestProperty("Accept-Language", "zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2");
        con.setRequestProperty("Connection", "keep-alive");
        con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        con.setRequestProperty("Host", "homepage.hit.edu.cn");
        con.setRequestProperty("Origin", "http://homepage.hit.edu.cn");
        con.setRequestProperty("Referer", "http://homepage.hit.edu.cn/school-dept?id=1&browseName=%25E6%25A0%25A1%25E5%2586%2585%25E5%258D%2595%25E4%25BD%258D&browseEnName=DEPARTMENT");
        con.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0");
        con.setRequestProperty("X-Requested-With", "XMLHttpRequest");

        // 构造 POST 请求参数
        String id = "1"; // 你的 id 参数值
        String orderType = "1"; // 你的 orderType 参数值
        String postParams = "deptId=" + deptId + "&id=" + id + "&orderType=" + orderType;
        // 发送POST请求
        con.setDoOutput(true);
        try (OutputStream os = con.getOutputStream()) {
            byte[] input = postParams.getBytes("utf-8");
            os.write(input, 0, input.length);
        }
        int responseCode = con.getResponseCode();

        List<String> userInfoList = new ArrayList<>();

        if (responseCode == HttpURLConnection.HTTP_OK) {
            try (BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()))) {
                String inputLine;
                StringBuilder response = new StringBuilder();

                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }

                // 解析JSON响应
                JSONObject jsonResponse = new JSONObject(response.toString());
                JSONArray userList = jsonResponse.getJSONArray("list");
                for (int i = 0; i < userList.length(); i++) {
                    JSONObject user = userList.getJSONObject(i);
                    userInfoList.add(user.toString());
                }
            }
        } else {
            System.out.println("POST 请求未成功");
        }
        return userInfoList;
    }

    // 根据用户信息中的 url 获取用户详细信息
    public static String getUserDetail(String userInfo) throws Exception {
        JSONObject userJson = new JSONObject(userInfo);

        // Check if url field exists and is not null
        if (!userJson.has("url") || userJson.isNull("url")) {
            return "No URL available for this user.";
        }

        String url = "http://homepage.hit.edu.cn/" + userJson.getString("url");
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("GET");
        int responseCode = con.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            try (BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"))) {
                StringBuilder response = new StringBuilder();
                String inputLine;
                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                // 解析 HTML 并提取详细信息
                return response.toString();
            }
        } else {
            return "Error getting user detail. Response code: " + responseCode;
        }
    }

    // Extract name from HTML
    public static String extractName(String htmlContent) {
        Document doc = Jsoup.parse(htmlContent);
        Element nameElement = doc.selectFirst("body > div:nth-of-type(1) > div:nth-of-type(3) > div:nth-of-type(1) > div:nth-of-type(2) > h3");
        if (nameElement != null) {
            return nameElement.text();
        } else {
            return "Name not found";
        }
    }

    // Extract email from HTML
    public static String extractEmail(String htmlContent) {
        Document doc = Jsoup.parse(htmlContent);
        Element emailElement = doc.selectFirst("body > div:nth-of-type(5) > div > div > div:nth-of-type(2) > div:nth-of-type(1) > ul:nth-of-type(1) > li:nth-of-type(3) > div > p");
        if (emailElement != null) {
            return emailElement.text();
        } else {
            return "Email not found";
        }
    }

    // Extract discipline from HTML
    public static String extractDiscipline(String htmlContent) {
        Document doc = Jsoup.parse(htmlContent);
        Element disciplineElement = doc.selectFirst("#teacher_info > div:nth-child(2) > div.part4.part > ul > li:nth-child(2) > span");
        if (disciplineElement != null) {
            return disciplineElement.text();
        } else {
            return "Discipline not found";
        }
    }

    // Extract phone from HTML
    public static String extractPhone(String htmlContent) {
        Document doc = Jsoup.parse(htmlContent);
        Element phoneElement = doc.selectFirst("#col-r > div.cont > ul.ul-cont > li:nth-child(1) > div > p");
        if (phoneElement != null) {
            return phoneElement.text();
        } else {
            return "Phone not found";
        }
    }


}
