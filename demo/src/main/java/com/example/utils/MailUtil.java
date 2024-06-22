package com.example.utils;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

//type = 0 学生注册成功
//type = 1 预约成功
//type = 2 预约删除通知
public class MailUtil {
	public static Session sendEmail(String email, String detail, int type) {
		// 1.创建连接对象javax.mail.Session
		// 2.创建邮件对象 javax.mail.Message
		// 3.发送一封激活邮件
		String from = "3338329165@qq.com";// 发件人电子邮箱
		String host = "smtp.qq.com"; // 指定发送邮件的主机smtp.qq.com(QQ)|smtp.163.com(网易)
		String code = "aumftytpsgdpcgjd"; // 发件人邮箱账号、授权码

		Properties properties = System.getProperties();// 获取系统属性

		properties.setProperty("mail.smtp.host", host);// 设置邮件服务器
		properties.setProperty("mail.transport.protocol", "smtp");
		// properties.setProperty("mail.smtp.port", "587");  //不需要 默认端口
		properties.setProperty("mail.smtp.auth", "true");// 打开认证
		// properties.put("mail.smtp.socketFactory", "javax.net.ssl.SSLSocketFactory");

		try {
			// QQ邮箱需要下面这段代码，163邮箱不需要
			MailSSLSocketFactory sf = new MailSSLSocketFactory();
			sf.setTrustAllHosts(true);
			properties.put("mail.smtp.ssl.enable", "true");
			properties.put("mail.smtp.ssl.socketFactory", sf);
			properties.put("mail.smtp.ssl.protocols", "TLSv1.2"); //加上这句解决问题

			// 1.获取默认session对象
			Session session = Session.getDefaultInstance(properties, new Authenticator() {
				@Override
				public PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(from, code);
				}
			});

			session.setDebug(true);

			//2、通过session得到transport对象
			Transport transport = session.getTransport();
			//3、使用用户名和授权码连上邮件服务器
			transport.connect(host, from, code);

			// 4.创建邮件对象
			Message message = new MimeMessage(session);
			// 4.1设置发件人
			message.setFrom(new InternetAddress(from));
			// 4.2设置接收人
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			// 4.3设置邮件主题
			String title = "测试标题";
			if (type == 0) {
				title = "欢迎您注册教师信息管理系统！";
			} else if (type == 1) {
				title = "预约成功";
			}
			message.setSubject(title);
			// 2.4设置邮件内容
			String content = "";
			if (type == 0) {
				String[] details = detail.split(",");
				String username = details[0];
				String password = details[1];
				String name = details[2];
				content = "尊敬的 " +
						name +
						" 同学，\n" +
						"欢迎您成功注册教师信息管理系统！\n" +
						"我们非常高兴您加入我们的大家庭。作为注册成功的新成员，您现在可以享受以下系统的各种功能和服务：\n" +
						"1. 查看教师信息：您可以浏览各位优秀教师的个人资料、教学经验和专业技能。\n" +
						"2. 教师预约：您可以预约心仪的教师的课程，并与他们进行一对一的学习交流。\n" +
						"您的登录凭证如下：\n" +
						"用户名：" +
						username +
						"\n" +
						"密码：" +
						password +
						"\n\n" +
						"请妥善保管您的登录凭证，避免泄露给他人。如有任何疑问或需要帮助，请随时联系我们的客服团队，我们将竭诚为您提供支持。\n\n" +
						"再次感谢您的注册！让我们一同努力，共同成长！\n\n" +
						"祝学业有成，生活愉快！\n\n" +
						"教师信息管理系统团队";
			} else if (type == 1) {
				String[] details = detail.split(",");
				String studentName = details[0];
				String teacherName = details[1];
				String date = details[2];
				String time = convertToChinese(details[3]);
				String place = convertToChinese(details[4]);

				content = "尊敬的 " +
						studentName +
						" 同学，\n" +
						"您好！您已成功预约 " +
						teacherName +
						" 老师的课程。\n" +
						"预约详情如下：\n" +
						"日期：" +
						date +
						"\n" +
						"时间：" +
						time +
						"\n" +
						"地点：" +
						place +
						"\n\n" +
						"请按时前往指定地点参加课程。\n\n" +
						"如有任何疑问或需要进一步的帮助，请随时与我们联系。\n\n" +
						"谢谢您的预约！祝您学习愉快！\n\n" +
						"教师信息管理系统团队";
			}
			message.setContent(content, "text/html;charset=UTF-8");

			//5、发送邮件
			transport.sendMessage(message, message.getAllRecipients());
			//6、关闭连接
			transport.close();
			System.out.println("邮件成功发送!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String convertToChinese(String variable) {
		switch (variable) {
			case "morning":
				return "早上";
			case "afternoon":
				return "下午";
			case "evening":
				return "晚上";
			case "office":
				return "办公室";
			case "library":
				return "图书馆";
			case "classroom":
				return "教室";
			default:
				return "未知";
		}
	}
}