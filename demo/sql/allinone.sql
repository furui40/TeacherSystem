
CREATE TABLE Users (
                       UserID INT PRIMARY KEY AUTO_INCREMENT,
                       Username VARCHAR(50) UNIQUE NOT NULL,
                       Password VARCHAR(50) NOT NULL,
                       UserType ENUM('Teacher', 'Student','Admin') NOT NULL
);


CREATE TABLE Teachers (
                          TeacherID INT PRIMARY KEY AUTO_INCREMENT,
                          UserID INT UNIQUE NOT NULL,
                          Name VARCHAR(100) NOT NULL,
                          Email VARCHAR(100),
                          Profession VARCHAR(20),
                          Bio TEXT,
                          FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE students (
                          StudentID INT PRIMARY KEY AUTO_INCREMENT,
                          UserID INT,
                          Name VARCHAR(100),
                          Email VARCHAR(100),
                          FOREIGN KEY (UserID) REFERENCES users(UserID)
);

CREATE TABLE Research (
                          ResearchID INT PRIMARY KEY AUTO_INCREMENT,
                          TeacherID INT NOT NULL,
                          Title VARCHAR(255) NOT NULL,
                          Description TEXT,
                          Date DATE,
                          FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

CREATE TABLE Appointments (
                              AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
                              StudentID INT NOT NULL,
                              TeacherID INT NOT NULL,
                              Date DATE,
                              Place VARCHAR(255) NOT NULL,
                              AppointmentTime ENUM('morning', 'afternoon', 'evening') NOT NULL,
                              FOREIGN KEY (StudentID) REFERENCES Users(UserID),
                              FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

CREATE TABLE Schedule (
                          ScheduleID INT PRIMARY KEY AUTO_INCREMENT,
                          TeacherID INT NOT NULL,
                          Date DATE,
                          TimeSlot VARCHAR(100),
                          FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (1, 't1', '123', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (2, 't2', '123', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (3, 's1', '123', 'Student');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (4, 's2', '123', 'Student');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (5, 't3', '123', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (6, 't4', '123', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (7, 'a1', '123', 'Admin');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (8, 'liliyi@hit.edu.cn', 'liliyi@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (9, 'a2', '123', 'Admin');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (10, 'dianqi@hit.edu.cn', 'dianqi@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (13, 'tanliguo@hit.edu.cn', 'tanliguo@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (18, 'liuchen2016@hit.edu.cn', 'liuchen2016@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (23, 'judandan.love@163.com', 'judandan.love@163.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (28, 'lcfeng@hit.edu.cn', 'lcfeng@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (33, 'fengdecheng@hit.edu.cn', 'fengdecheng@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (38, 'hitbm@163.com', 'hitbm@163.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (43, 'zhangf@hit.edu.cn', 'zhangf@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (48, '18745059800@126.com', '18745059800@126.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (53, 'weiquan@hit.edu.cn', 'weiquan@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (58, 'hitlaura@126.com', 'hitlaura@126.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (63, 'hityuanqing@hit.edu.cn', 'hityuanqing@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (68, 'wfang2004@126.com', 'wfang2004@126.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (73, 'su.wq@hit.edu.cn', 'su.wq@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (78, 'liuying01@hit.edu.cn', 'liuying01@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (83, 'gaolixin@hit.edu.cn', 'gaolixin@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (88, 'lj9653@126.com', 'lj9653@126.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (93, 'mengmeng.li@hit.edu.cn', 'mengmeng.li@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (98, '1261869728@qq.com', '1261869728@qq.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (103, 'lgd@hit.edu.cn', 'lgd@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (108, 'hitzhaobo@hit.edu.cn', 'hitzhaobo@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (113, 'zhangzhiguo@hit.edu.cn', 'zhangzhiguo@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (118, 'zhaoyp2590@hit.edu.cn', 'zhaoyp2590@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (123, 'chenganghit@hit.edu.cn', 'chenganghit@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (128, 'spzhang@hit.edu.cn', 'spzhang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (133, 'fanshiwei@hit.edu.cn', 'fanshiwei@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (138, 'zhangxiangning1978@163.com', 'zhangxiangning1978@163.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (143, 'zhouzx@hit.edu.cn', 'zhouzx@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (148, 'jinux@hit.edu.cn', 'jinux@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (153, 'louxiutao@hit.edu.cn', 'louxiutao@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (158, 'wangzhihong@hit.edu.cn', 'wangzhihong@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (163, 'zhangbing@hit.edu.cn', 'zhangbing@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (168, 'bopingt361147@hit.edu.cn', 'bopingt361147@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (173, 'zbd@hit.edu.cn', 'zbd@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (178, 'lizhaoyan@hit.edu.cn', 'lizhaoyan@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (183, 'yangzhan_wen@hit.edu.cn', 'yangzhan_wen@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (188, 'zhangdazhi@hit.edu.cn', 'zhangdazhi@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (193, 'yingzw@hit.edu.cn', 'yingzw@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (198, 'zhangxia@hit.edu.cn', 'zhangxia@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (203, 'lczhao@hit.edu.cn', 'lczhao@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (208, 'xjhit@hit.edu.cn', 'xjhit@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (213, 'htfang@hit.edu.cn', 'htfang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (218, 'yf306@hit.edu.cn', 'yf306@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (223, 'chenyb@hit.edu.cn', 'chenyb@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (228, 'gfwang@hit.edu.cn', 'gfwang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (233, 'jfsun_hit@263.net', 'jfsun_hit@263.net', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (238, 'wangzj@hit.edu.cn', 'wangzj@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (243, 'weizj@hit.edu.cn', 'weizj@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (248, 'yongchaoxu@hit.edu.cn', 'yongchaoxu@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (253, 'liuw@hit.edu.cn', 'liuw@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (258, 'mingfang.qian@hit.edu.cn', 'mingfang.qian@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (263, 'fclwh@hit.edu.cn', 'fclwh@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (268, 'tangs@hit.edu.cn', 'tangs@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (273, 'chunzhigong@163.com', 'chunzhigong@163.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (278, 'guanzj1992@163.com', 'guanzj1992@163.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (283, 'shaoqinliu@hit.edu.cn', 'shaoqinliu@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (288, 'weilijun@hit.edu.cn', 'weilijun@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (293, 'liucp74@hotmail.com', 'liucp74@hotmail.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (298, 'hanfang@hit.edu.cn', 'hanfang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (303, 'quanqiquan@hit.edu.cn', 'quanqiquan@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (308, 'zhaojingdong@hit.edu.cn', 'zhaojingdong@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (313, 'dwtang@hit.edu.cn', 'dwtang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (318, 'xdyang@hit.edu.cn', 'xdyang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (323, 'bradywang@hit.edu.cn', 'bradywang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (328, 'hjw@hope.hit.edu.cn', 'hjw@hope.hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (333, 'mhjin@hit.edu.cn', 'mhjin@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (338, 'jianghz@hit.edu.cn', 'jianghz@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (343, 'whx@hit.edu.cn', 'whx@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (348, 'zp@hit.edu.cn', 'zp@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (353, 'jkliu@hit.edu.cn', 'jkliu@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (358, 'hjfeng@hit.edu.cn', 'hjfeng@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (363, 'dongguojun@hit.edu.cn', 'dongguojun@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (368, 'zhaoxl@hit.edu.cn', 'zhaoxl@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (373, 'yezhm@hit.edu.cn', 'yezhm@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (378, 'sunkui@hit.edu.cn', 'sunkui@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (383, 'xiangdong@hit.edu.cn', 'xiangdong@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (388, 'yanghuaiguang@hit.edu.cn', 'yanghuaiguang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (393, 'davisjwr@163.com', 'davisjwr@163.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (398, 'zhouzhinan@hit.edu.cn', 'zhouzhinan@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (403, 'psy001@hit.edu.cn', 'psy001@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (408, 'nlwu@hit.edu.cn', 'nlwu@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (413, 'zhaojiaying@hit.edu.cn', 'zhaojiaying@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (418, 'fengpeicheng2002@yahoo.com.cn', 'fengpeicheng2002@yahoo.com.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (423, 'hithd8376@163.com', 'hithd8376@163.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (428, 'lijiehong@hit.edu.cn', 'lijiehong@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (433, 'lyzhang08@163.com', 'lyzhang08@163.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (438, 'yuqilihit@126.com', 'yuqilihit@126.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (443, 'lnina_hit@163.com', 'lnina_hit@163.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (448, 'zhujq@hit.edu.cn', 'zhujq@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (453, 'wangcg@hit.edu.cn', 'wangcg@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (458, 'mengsh@hit.edu.cn', 'mengsh@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (463, 'myang@hit.edu.cn', 'myang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (468, 'dixiaoguang@hit.edu.cn', 'dixiaoguang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (473, 'dychen@hit.edu.cn', 'dychen@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (478, 'hongcq@hit.edu.cn', 'hongcq@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (483, 'qinmok@163.com', 'qinmok@163.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (488, 'hezhen@hit.edu.cn', 'hezhen@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (493, 'wang2352@hit.edu.cn', 'wang2352@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (498, 'zhouzhg@hit.edu.cn', 'zhouzhg@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (503, 'zhym@hit.edu.cn', 'zhym@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (508, 'juyoulun@126.com', 'juyoulun@126.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (513, 'sjf@hit.edu.cn', 'sjf@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (518, 'xumq@hit.edu.cn', 'xumq@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (523, 'yuhongjun@hit.edu.cn', 'yuhongjun@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (528, 'lyf04025121@126.com', 'lyf04025121@126.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (533, 'xin.zhang@hit.edu.cn', 'xin.zhang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (538, 'zhixiyang@hit.edu.cn', 'zhixiyang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (543, 'zhoup@hit.edu.cn', 'zhoup@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (548, 'sqiang@hit.edu.cn', 'sqiang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (553, 'feng_tttf@hit.edu.cn', 'feng_tttf@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (558, 'mycong@hit.edu.cn', 'mycong@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (563, 'suichao@hit.edu.cn', 'suichao@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (568, 'lifengfeng@hit.edu.cn', 'lifengfeng@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (573, 'jianlongz@hit.edu.cn', 'jianlongz@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (578, 'zhaowei_2022@163.com', 'zhaowei_2022@163.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (583, 'lingmx@hit.edu.cn', 'lingmx@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (588, 'caozhen1995@hit.edu.cn', 'caozhen1995@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (593, 'lixinlin@hit.edu.cn', 'lixinlin@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (598, 'gaogang@hit.edu.cn', 'gaogang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (603, 'yuyanghit@hit.edu.cn', 'yuyanghit@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (608, 'wgao@pku.edu.cn', 'wgao@pku.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (613, 'jqhan@hit.edu.cn', 'jqhan@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (618, 'guanyi@hit.edu.cn', 'guanyi@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (623, 'tangxl@hit.edu.cn', 'tangxl@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (628, 'liubq@hit.edu.cn', 'liubq@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (633, 'xuzm@hit.edu.cn', 'xuzm@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (638, 'liuxianmin@hit.edu.cn', 'liuxianmin@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (643, 'xhc@hit.edu.cn', 'xhc@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (648, 'linl@insun.hit.edu.cn', 'linl@insun.hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (653, 'ajian.he@hit.edu.cn', 'ajian.he@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (658, 'matao@hit.edu.cn', 'matao@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (663, 'yug@hit.edu.cn', 'yug@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (668, 'wjsun@hit.edu.cn', 'wjsun@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (673, 'shuamei@hit.edu.cn', 'shuamei@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (678, 'wuweiwei@hit.edu.cn', 'wuweiwei@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (683, 'iriszhang@hit.edu.cn', 'iriszhang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (688, 'yanglj976@163.com', 'yanglj976@163.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (693, 'awg888@sina.com', 'awg888@sina.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (698, 'hongqi@hit.edu.cn', 'hongqi@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (703, 'hittianyu@163.com', 'hittianyu@163.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (708, 'lbf@hit.edu.cn', 'lbf@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (713, 'xgr099@outlook.com', 'xgr099@outlook.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (718, 'zhengtong@hit.edu.cn', 'zhengtong@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (723, 'hitzzh@hit.edu.cn', 'hitzzh@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (728, 'zhylee@hit.edu.cn', 'zhylee@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (733, 'yaojiejiehit@163.com', 'yaojiejiehit@163.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (738, 'shanshanyang@hit.edu.cn', 'shanshanyang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (743, 'fsq@hit.edu.cn', 'fsq@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (748, 'zhengping@hit.edu.cn', 'zhengping@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (753, 'yupwrs@hit.edu.cn', 'yupwrs@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (758, 'jsy@hit.edu.cn', 'jsy@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (763, 'wjq@hit.edu.cn', 'wjq@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (768, 'fenmiao@hit.edu.cn', 'fenmiao@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (773, 'hongjun@hit.edu.cn', 'hongjun@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (778, 'yangguijie@hit.edu.cn', 'yangguijie@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (783, 'shangjing@hit.edu.cn', 'shangjing@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (788, 'sujianyong@hit.edu.cn', 'sujianyong@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (793, '596971192@qq.com', '596971192@qq.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (798, 'chenab@hit.edu.cn', 'chenab@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (803, 'hitlaoyang@hit.edu.cn', 'hitlaoyang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (808, 'weifangrui@hit.edu.cn', 'weifangrui@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (813, 'tanghx@hit.edu.cn', 'tanghx@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (818, 'yudaren@hit.edu.cn', 'yudaren@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (823, 'wangzhongqi@hit.edu.cn', 'wangzhongqi@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (828, 'sunsz@hit.edu.cn', 'sunsz@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (833, 'yuanyuan83@hit.edu.cn', 'yuanyuan83@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (838, 'peigang_y@163.com', 'peigang_y@163.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (843, 'zhouxun@hit.edu.cn', 'zhouxun@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (848, 'jinfuliu@hit.edu.cn', 'jinfuliu@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (853, 'hit_chenxue@hit.edu.cn', 'hit_chenxue@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (858, 'kongchen@hit.edu.cn', 'kongchen@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (863, 'zch-hit@hit.edu.cn', 'zch-hit@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (868, 'baoyuequan@hit.edu.cn', 'baoyuequan@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (873, 'zhouwei-hit@163.com', 'zhouwei-hit@163.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (878, 'yzyang@hit.edu.cn', 'yzyang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (883, 'gengyue@hit.edu.cn', 'gengyue@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (888, 'huazhang.zhou@hit.edu.cn', 'huazhang.zhou@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (893, 'jiamingming@hit.edu.cn', 'jiamingming@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (898, 'pengyu@hit.edu.cn', 'pengyu@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (903, 'yuqiyue@hit.edu.cn', 'yuqiyue@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (908, 'jsd@hit.edu.cn', 'jsd@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (913, 'qiaoliyan@hit.edu.cn', 'qiaoliyan@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (918, 'hlzhao@hit.edu.cn', 'hlzhao@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (923, 'zhangyunhit@hit.edu.cn', 'zhangyunhit@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (928, 'hechenguang@hit.edu.cn', 'hechenguang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (933, 'ligaopeng@hit.edu.cn', 'ligaopeng@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (938, 'lihongmei@hit.edu.cn', 'lihongmei@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (943, 'sunchao@hit.edu.cn', 'sunchao@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (948, 'dongyn@hit.edu.cn', 'dongyn@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (953, 'zhengwei@hit.edu.cn', 'zhengwei@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (958, 'xinhuang@hit.edu.cn', 'xinhuang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (963, 'wangzhijiang@hit.edu.cn', 'wangzhijiang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (968, 'sunjm@hit.edu.cn', 'sunjm@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (973, 'jiangbo5981@hit.edu.cn', 'jiangbo5981@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (978, 'dytang@hit.edu.cn', 'dytang@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (983, 'zhangchunhua@hit.edu.cn', 'zhangchunhua@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (988, 'lusongtao@hit.edu.cn', 'lusongtao@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (993, 'chengxq@hit.edu.cn', 'chengxq@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (998, 'lcsong@hit.edu.cn', 'lcsong@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (1003, 'peijian008@163.com', 'peijian008@163.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (1008, 'wp@hit.edu.cn', 'wp@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (1013, 'lideyu@hit.edu.cn', 'lideyu@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (1018, 'panlei@hit.edu.cn', 'panlei@hit.edu.cn', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (1023, 'zzxiang01@163.com', 'zzxiang01@163.com', 'Teacher');
INSERT INTO teacher.users (UserID, Username, Password, UserType) VALUES (1028, 'test', '123', 'Teacher');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (1, 1, '教师1', 'teacher1@example.com', '数学', '教师1的简介');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (2, 2, '教师2', '123@example', '数学', '教师2的简介');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (3, 5, '教师3', '123@example', '数学', '教师3的简介');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (4, 6, '教师4', '123@example', '计算机', '教师4的简介');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (19, 8, '李立毅', 'liliyi@hit.edu.cn', '电气工程', '0451-86403785');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (20, 10, '佟为明', 'dianqi@hit.edu.cn', '电气工程', '13904615300');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (23, 13, '谭立国', 'tanliguo@hit.edu.cn', '控制科学与工程', '15504655181');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (27, 18, '刘琛', 'liuchen2016@hit.edu.cn', '材料科学与工程', '18604503452');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (32, 23, '琚丹丹', 'judandan.love@163.com', '材料科学与工程', '18846048358');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (37, 28, '刘春凤', 'lcfeng@hit.edu.cn', '材料科学与工程', '0451-86402051');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (42, 33, '冯德成', 'fengdecheng@hit.edu.cn', '交通运输工程', '0451-86282116');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (47, 38, '葛勇', 'hitbm@163.com', '交通运输工程', '0451-86282191');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (52, 43, '张锋', 'zhangf@hit.edu.cn', '交通运输工程,土木工程', '0451-86282116');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (57, 48, '李忠龙', '18745059800@126.com', '土木工程', '0451-86282121');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (62, 53, '全威', 'weiquan@hit.edu.cn', '交通运输工程', '0451-86283779');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (67, 58, '冷红', 'hitlaura@126.com', '城乡规划学', '0451-86281053');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (72, 63, '袁青', 'hityuanqing@hit.edu.cn', '城乡规划学', '045186281057');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (77, 68, '王芳', 'wfang2004@126.com', '土木工程', '0451-86282123');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (82, 73, '苏万庆', 'su.wq@hit.edu.cn', '城乡规划学', '0451-86281065');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (87, 78, '刘滢', 'liuying01@hit.edu.cn', '建筑学', '0451-86281142');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (92, 83, '高立新', 'gaolixin@hit.edu.cn', '土木工程', '0451-86282123');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (97, 88, '梁静', 'lj9653@126.com', '请选择', '0451-86281135');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (102, 93, '李朦朦', 'mengmeng.li@hit.edu.cn', '风景园林学', '0451-86281083');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (107, 98, '马和', '1261869728@qq.com', '城市规划', '13199539777');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (112, 103, '刘国栋', 'lgd@hit.edu.cn', '仪器科学与技术', '0451-86402312-802');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (117, 108, '赵勃', 'hitzhaobo@hit.edu.cn', '仪器科学与技术', '13674681656');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (122, 113, '张治国', 'zhangzhiguo@hit.edu.cn', '仪器科学与技术,物理学', '13684600028');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (127, 118, '赵永平', 'zhaoyp2590@hit.edu.cn', '仪器科学与技术', '86413621-815');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (132, 123, '陈刚', 'chenganghit@hit.edu.cn', '仪器科学与技术', '13945067581');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (137, 128, '张世平', 'spzhang@hit.edu.cn', '仪器科学与技术', '13936493277');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (142, 133, '范世伟', 'fanshiwei@hit.edu.cn', '仪器科学与技术', '18845070213');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (147, 138, '张向宁', 'zhangxiangning1978@163.com', '建筑学,建筑学,建筑学硕士', '18686833168');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (152, 143, '周忠祥', 'zhouzx@hit.edu.cn', '物理学', '0451-86414130');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (157, 148, '张井波', 'jinux@hit.edu.cn', '物理学', '86402046');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (162, 153, '娄秀涛', 'louxiutao@hit.edu.cn', '物理学', '0451-86414109');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (167, 158, '王志红', 'wangzhihong@hit.edu.cn', '物理学', '0451-86414120');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (172, 163, '张冰', 'zhangbing@hit.edu.cn', '物理学', '13796626288');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (177, 168, '田波平', 'bopingt361147@hit.edu.cn', '统计学', '86412607');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (182, 173, '郑宝东', 'zbd@hit.edu.cn', '数学', '0451-6414206');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (187, 178, '李朝艳', 'lizhaoyan@hit.edu.cn', '数学', '0451-86412607');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (192, 183, '杨占文', 'yangzhan_wen@hit.edu.cn', '数学', '微信Yangzhanwen1979');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (197, 188, '张达治', 'zhangdazhi@hit.edu.cn', '数学', '0451-86414208');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (202, 193, '王忠英', 'yingzw@hit.edu.cn', '数学', '0451-86414209');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (207, 198, '张夏', 'zhangxia@hit.edu.cn', '数学', '86414216');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (212, 203, '赵连城', 'lczhao@hit.edu.cn', '材料科学与工程', '0451-86418329');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (217, 208, '徐杰', 'xjhit@hit.edu.cn', '材料科学与工程', '0451-86403958');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (222, 213, '方海涛', 'htfang@hit.edu.cn', '材料科学与工程', '13633611057');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (226, 218, '叶枫', 'yf306@hit.edu.cn', '材料科学与工程', '0451-86418736');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (231, 223, '陈彦宾', 'chenyb@hit.edu.cn', '材料科学与工程', '045186418645');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (236, 228, '王国峰', 'gfwang@hit.edu.cn', '材料科学与工程', '13904516689');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (241, 233, '孙剑飞', 'jfsun_hit@263.net', '材料科学与工程', '0451-86413904');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (246, 238, '王忠金', 'wangzj@hit.edu.cn', '材料科学与工程', '13503631298');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (251, 243, '魏尊杰', 'weizj@hit.edu.cn', '材料科学与工程', '86418773');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (256, 248, '徐永超', 'yongchaoxu@hit.edu.cn', '材料科学与工程', '0451-86415754');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (261, 253, '刘伟', 'liuw@hit.edu.cn', '材料科学与工程', '0451-86413115');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (266, 258, '钱明芳', 'mingfang.qian@hit.edu.cn', '材料科学与工程', '13654503605');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (271, 263, '范成磊', 'fclwh@hit.edu.cn', '材料科学与工程', '15244687918');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (276, 268, '唐莎巍', 'tangs@hit.edu.cn', '材料科学与工程', '13946147616,86415894');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (281, 273, '巩春志', 'chunzhigong@163.com', '材料科学与工程', '13936587106');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (286, 278, '管振杰', 'guanzj1992@163.com', '材料科学与工程', '0451-86412133');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (295, 288, '魏力军', 'weilijun@hit.edu.cn', '生物医学工程', '86412863');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (300, 293, '刘川鹏', 'liucp74@hotmail.com', '生物医学工程', '86412863');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (305, 298, '韩放', 'hanfang@hit.edu.cn', '生物学', '0451-86402690');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (310, 303, '全齐全', 'quanqiquan@hit.edu.cn', '机械工程,航空宇航科学与技术', '13845089805');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (315, 308, '赵京东', 'zhaojingdong@hit.edu.cn', '机械工程', '0451-86402360-4181');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (320, 313, '唐德威', 'dwtang@hit.edu.cn', '机械工程', '13009725818');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (325, 318, '杨晓冬', 'xdyang@hit.edu.cn', '机械工程', '86403845（内线）');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (330, 323, '王波', 'bradywang@hit.edu.cn', '机械工程', '0451-86415244');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (335, 328, '韩俊伟', 'hjw@hope.hit.edu.cn', '机械工程', '6413253');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (340, 333, '金明河', 'mhjin@hit.edu.cn', '机械工程', '86402360-802');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (345, 338, '姜洪洲', 'jianghz@hit.edu.cn', '机械工程', '0451-86413253');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (350, 343, '王洪祥', 'whx@hit.edu.cn', '机械工程', '86413802');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (355, 348, '张鹏', 'zp@hit.edu.cn', '机械工程', '微信：ZhangPeng_HIT');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (360, 353, '刘军考', 'jkliu@hit.edu.cn', '机械工程', '0451-86416119');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (365, 358, '何景峰', 'hjfeng@hit.edu.cn', '机械工程', '0451-86413253');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (370, 363, '董国军', 'dongguojun@hit.edu.cn', '机械工程', '15244667050');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (375, 368, '赵小力', 'zhaoxl@hit.edu.cn', '机械工程', '15245023791');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (380, 373, '叶正茂', 'yezhm@hit.edu.cn', '机械工程', '13936241173');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (385, 378, '孙奎', 'sunkui@hit.edu.cn', '机械工程', '13845082784');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (390, 383, '向东', 'xiangdong@hit.edu.cn', '机械工程', '18104626368');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (395, 388, '杨怀广', 'yanghuaiguang@hit.edu.cn', '航空宇航科学与技术', '+86 18945106467');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (400, 393, '姜文锐', 'davisjwr@163.com', '机械工程', '0451-86282156');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (405, 398, '周之南', 'zhouzhinan@hit.edu.cn', '外国语言文学,翻译', '0451-86414510');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (410, 403, '裴秋宇', 'psy001@hit.edu.cn', '社会学', '0451 86413869');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (415, 408, '伍楠林', 'nlwu@hit.edu.cn', '应用经济学', '13903611555');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (420, 413, '赵嘉影', 'zhaojiaying@hit.edu.cn', '外国语言文学', '0451-86414507');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (425, 418, '冯佩成', 'fengpeicheng2002@yahoo.com.cn', '外国语言文学', '0451-88888888');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (430, 423, '周洁', 'hithd8376@163.com', '外国语言文学', '17645063322');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (435, 428, '李洁红', 'lijiehong@hit.edu.cn', '外国语言文学', '86414518');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (440, 433, '张凌岩', 'lyzhang08@163.com', '外国语言文学', '0451-86413827');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (445, 438, '李文戈', 'yuqilihit@126.com', '外国语言文学', '13503639557');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (450, 443, '刘颖', 'lnina_hit@163.com', '外国语言文学', '0451-86403505');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (455, 448, '朱嘉琦', 'zhujq@hit.edu.cn', '航空宇航科学与技术,材料科学与工程', '0451-86417970');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (460, 453, '王长国', 'wangcg@hit.edu.cn', '力学', '0451-86402368');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (465, 458, '孟松鹤', 'mengsh@hit.edu.cn', '力学', '0451-86417560');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (470, 463, '杨明', 'myang@hit.edu.cn', '控制科学与工程', '0451-86418236');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (475, 468, '遆晓光', 'dixiaoguang@hit.edu.cn', '控制科学与工程', '0451-86402946');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (480, 473, '陈德应', 'dychen@hit.edu.cn', '电子科学与技术', '0451-86402837');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (485, 478, '洪长青', 'hongcq@hit.edu.cn', '材料科学与工程', '0451-86403016');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (490, 483, '齐乃明', 'qinmok@163.com', '航空宇航科学与技术', '13904616371');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (495, 488, '何朕', 'hezhen@hit.edu.cn', '控制科学与工程', '86413411-8504');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (500, 493, '王春晖', 'wang2352@hit.edu.cn', '光学工程,电子科学与技术', '86413164');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (505, 498, '周振功', 'zhouzhg@hit.edu.cn', '力学', '86402396');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (510, 503, '张宇民', 'zhym@hit.edu.cn', '航空宇航科学与技术', '13946149476');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (515, 508, '鞠有伦', 'juyoulun@126.com', '光学工程,电子科学与技术', '86402825');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (520, 513, '孙剑峰', 'sjf@hit.edu.cn', '电子科学与技术', '0451-86413164');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (525, 518, '徐敏强', 'xumq@hit.edu.cn', '力学', '0451-86414479');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (530, 523, '于红军', 'yuhongjun@hit.edu.cn', '力学', '18045145530');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (535, 528, '刘延芳', 'lyf04025121@126.com', '航空宇航科学与技术', '15004678594');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (540, 533, '章欣', 'xin.zhang@hit.edu.cn', '控制科学与工程', '0451-86413411-8602');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (545, 538, '智喜洋', 'zhixiyang@hit.edu.cn', '光学工程', '18686760508');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (550, 543, '周鹏', 'zhoup@hit.edu.cn', '力学', '0451-86418100');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (555, 548, '强盛', 'sqiang@hit.edu.cn', '控制科学与工程', '13945016267');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (560, 553, '谭峰', 'feng_tttf@hit.edu.cn', '控制科学与工程', '0451-86402224-8221');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (565, 558, '丛明煜', 'mycong@hit.edu.cn', '光学工程', '0451-86414883-704');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (570, 563, '隋超', 'suichao@hit.edu.cn', '材料科学与工程', '+86 13903651201');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (575, 568, '李丰丰', 'lifengfeng@hit.edu.cn', '力学', '0451-86414825');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (580, 573, '张建隆', 'jianlongz@hit.edu.cn', '电子科学与技术', '045186402148');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (585, 578, '赵伟', 'zhaowei_2022@163.com', '力学', '15776491280');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (590, 583, '凌明祥', 'lingmx@hit.edu.cn', '控制科学与工程', '18646538698');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (595, 588, '曹振', 'caozhen1995@hit.edu.cn', '电子科学与技术', '无');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (600, 593, '李鑫林', 'lixinlin@hit.edu.cn', '力学', '15145008685');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (605, 598, '高岗', 'gaogang@hit.edu.cn', '材料科学与工程,航空宇航科学与技术', '13054286998');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (610, 603, '俞洋', 'yuyanghit@hit.edu.cn', '信息与通信工程', '0451-86413531');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (615, 608, '高文', 'wgao@pku.edu.cn', '计算机科学与技术', '0451-86416485');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (620, 613, '韩纪庆', 'jqhan@hit.edu.cn', '计算机科学与技术', '0451-86417981');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (625, 618, '关毅', 'guanyi@hit.edu.cn', '计算机科学与技术', '15245107281');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (630, 623, '唐降龙', 'tangxl@hit.edu.cn', '计算机科学与技术', '86413631');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (635, 628, '刘秉权', 'liubq@hit.edu.cn', '计算机科学与技术', '18646139426');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (640, 633, '徐志明', 'xuzm@hit.edu.cn', '计算机科学与技术', '0451-86414495');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (645, 638, '刘显敏', 'liuxianmin@hit.edu.cn', '计算机科学与技术', '86403492');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (650, 643, '徐汉川', 'xhc@hit.edu.cn', '软件工程', '徐汉川，男，汉族，1976年生。工学博士，现工作于计算学部国家示范性软件学院，企业与服务智能计算研究中心，副教授，硕士生导师。研究方向：互联网服务计算，软件服务工程。');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (655, 648, '林磊', 'linl@insun.hit.edu.cn', '计算机科学与技术', '045186413322');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (660, 653, '何元政', 'ajian.he@hit.edu.cn', '生物学', '0451-86402026');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (665, 658, '马涛', 'matao@hit.edu.cn', '应用经济学', '0451-86414014');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (670, 663, '于光', 'yug@hit.edu.cn', '管理科学与工程', '86414144');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (675, 668, '孙文俊', 'wjsun@hit.edu.cn', '管理科学与工程', '0451-86414022');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (680, 673, '孙华梅', 'shuamei@hit.edu.cn', '工商管理', '17303617669');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (685, 678, '吴伟伟', 'wuweiwei@hit.edu.cn', '工商管理', '0451-86412771');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (690, 683, '张丹', 'iriszhang@hit.edu.cn', '工商管理', '0451-86416027');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (695, 688, '杨丽娇', 'yanglj976@163.com', '公共管理', '18771962619');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (700, 693, '艾文国', 'awg888@sina.com', '会计', '13804510102');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (705, 698, '齐虹', 'hongqi@hit.edu.cn', '环境科学与工程', '0451-86282105-2');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (710, 703, '田禹', 'hittianyu@163.com', '环境科学与工程', '13804589869');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (715, 708, '刘冰峰', 'lbf@hit.edu.cn', '环境科学与工程', '0451-86282110');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (720, 713, '许国仁', 'xgr099@outlook.com', '土木工程', '0451-86286838');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (725, 718, '郑彤', 'zhengtong@hit.edu.cn', '环境科学与工程', '0451-86283008');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (730, 723, '张照韩', 'hitzzh@hit.edu.cn', '环境科学与工程', '0451-86286804');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (735, 728, '李哲煜', 'zhylee@hit.edu.cn', '环境科学与工程', '0451-86286808');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (740, 733, '姚杰', 'yaojiejiehit@163.com', '环境科学与工程', '0451-86414943 13904501245');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (745, 738, '杨珊珊', 'shanshanyang@hit.edu.cn', '环境科学与工程', '15846339151');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (750, 743, '范胜强', 'fsq@hit.edu.cn', '环境科学与工程', '18504565999');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (755, 748, '郑萍', 'zhengping@hit.edu.cn', '电气工程', '86403086');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (760, 753, '于继来', 'yupwrs@hit.edu.cn', '电气工程', '0451-86413641-801');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (765, 758, '姜三勇', 'jsy@hit.edu.cn', '电气工程', '0451-');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (770, 763, '吴建强', 'wjq@hit.edu.cn', '电气工程', '0451-86413602');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (775, 768, '刘洪臣', 'fenmiao@hit.edu.cn', '电气工程', '13936463582');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (780, 773, '陈宏钧', 'hongjun@hit.edu.cn', '电气工程', '0451-86413050');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (785, 778, '杨贵杰', 'yangguijie@hit.edu.cn', '电气工程', '13304512561');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (790, 783, '尚静', 'shangjing@hit.edu.cn', '电气工程', '86413613');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (795, 788, '苏健勇', 'sujianyong@hit.edu.cn', '电气工程', '0451-86415240');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (800, 793, '赵克', '596971192@qq.com', '电气工程', '0451-86412946');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (805, 798, '陈安斌', 'chenab@hit.edu.cn', '动力工程及工程热物理', '15804600902');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (810, 803, '杨旭强', 'hitlaoyang@hit.edu.cn', '电气工程', '13604807071');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (815, 808, '魏方睿', 'weifangrui@hit.edu.cn', '电气工程', '0451-86413613');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (820, 813, '唐好选', 'tanghx@hit.edu.cn', '软件工程', '0451-86402808');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (825, 818, '于达仁', 'yudaren@hit.edu.cn', '动力工程及工程热物理', '0451-86403142');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (830, 823, '王仲奇', 'wangzhongqi@hit.edu.cn', '动力工程及工程热物理', '0451-6416715');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (835, 828, '孙绍增', 'sunsz@hit.edu.cn', '动力工程及工程热物理', '6412238/86413231');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (840, 833, '袁远', 'yuanyuan83@hit.edu.cn', '动力工程及工程热物理', '0451-86418194');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (845, 838, '颜培刚', 'peigang_y@163.com', '动力工程及工程热物理', '86412458');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (850, 843, '周逊', 'zhouxun@hit.edu.cn', '动力工程及工程热物理', '0451-86412478');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (855, 848, '刘金福', 'jinfuliu@hit.edu.cn', '动力工程及工程热物理', '0451-86412498');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (860, 853, '陈学', 'hit_chenxue@hit.edu.cn', '动力工程及工程热物理', '15124528536（微信）');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (865, 858, '孔辰', 'kongchen@hit.edu.cn', '动力工程及工程热物理', '18704629326');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (870, 863, '翟长海', 'zch-hit@hit.edu.cn', '土木工程', '86403564');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (875, 868, '鲍跃全', 'baoyuequan@hit.edu.cn', '力学', '0451-86282096');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (880, 873, '周威', 'zhouwei-hit@163.com', '土木工程', '13796609553');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (885, 878, '杨英姿', 'yzyang@hit.edu.cn', '土木工程', '0451-86281118');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (890, 883, '耿悦', 'gengyue@hit.edu.cn', '土木工程', '0451-86282084');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (895, 888, '周华樟', 'huazhang.zhou@hit.edu.cn', '土木工程', '13895779702');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (900, 893, '贾明明', 'jiamingming@hit.edu.cn', '土木工程', '0451-86282095');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (905, 898, '彭宇', 'pengyu@hit.edu.cn', '信息与通信工程', '15244684529');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (910, 903, '于启月', 'yuqiyue@hit.edu.cn', '信息与通信工程', '0451-86413513－8219');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (915, 908, '姜守达', 'jsd@hit.edu.cn', '信息与通信工程', '0451-86402985');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (920, 913, '乔立岩', 'qiaoliyan@hit.edu.cn', '信息与通信工程', '86413532-526');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (925, 918, '赵洪林', 'hlzhao@hit.edu.cn', '信息与通信工程', '0451-86413513-8117');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (930, 923, '张云', 'zhangyunhit@hit.edu.cn', '信息与通信工程', '(0451)86418051转8022');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (935, 928, '何晨光', 'hechenguang@hit.edu.cn', '信息与通信工程', '0451-86413513');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (940, 933, '李高鹏', 'ligaopeng@hit.edu.cn', '信息与通信工程', '0451-86418051-7072');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (945, 938, '李红梅', 'lihongmei@hit.edu.cn', '信息与通信工程', '18545001056');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (950, 943, '孙超', 'sunchao@hit.edu.cn', '信息与通信工程', '186465165??');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (955, 948, '董英凝', 'dongyn@hit.edu.cn', '信息与通信工程', '0451-86418051-7011');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (960, 953, '郑薇', 'zhengwei@hit.edu.cn', '信息与通信工程', '0451-86418050');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (965, 958, '黄鑫', 'xinhuang@hit.edu.cn', '化学工程与技术', '0451-86413709');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (970, 963, '王志江', 'wangzhijiang@hit.edu.cn', '化学工程与技术', '15804517306');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (975, 968, '孙建敏', 'sunjm@hit.edu.cn', '化学工程与技术', '045186403715');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (980, 973, '姜波', 'jiangbo5981@hit.edu.cn', '化学工程与技术', '0451-86414806');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (985, 978, '唐冬雁', 'dytang@hit.edu.cn', '化学工程与技术', '0451-86403607');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (990, 983, '张春华', 'zhangchunhua@hit.edu.cn', '化学工程与技术', '0451-86413711');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (995, 988, '卢松涛', 'lusongtao@hit.edu.cn', '化学', '15945773277');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (1000, 993, '程新群', 'chengxq@hit.edu.cn', '化学工程与技术', '13895755180');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (1005, 998, '宋梁成', 'lcsong@hit.edu.cn', '化学工程与技术', '18686837380');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (1010, 1003, '裴健', 'peijian008@163.com', '化学', '15765513308');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (1015, 1008, '王平', 'wp@hit.edu.cn', '化学工程与技术', '0451-86413710');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (1020, 1013, '黎德育', 'lideyu@hit.edu.cn', '化学工程与技术', '045186413721');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (1025, 1018, '潘磊', 'panlei@hit.edu.cn', '化学工程与技术', '0451-86403767');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (1030, 1023, '钟正祥', 'zzxiang01@163.com', '化学工程与技术', '18745090486');
INSERT INTO teacher.teachers (TeacherID, UserID, Name, Email, Profession, Bio) VALUES (1035, 1028, '测试', '123@123', '电气工程', '简介内容');
INSERT INTO teacher.students (StudentID, UserID, Name, Email) VALUES (1, 3, '学生1', '123@1');
INSERT INTO teacher.students (StudentID, UserID, Name, Email) VALUES (2, 4, '学生2', '123@2');
INSERT INTO teacher.students (StudentID, UserID, Name, Email) VALUES (7, 15, '学生3', '123@3');
INSERT INTO teacher.students (StudentID, UserID, Name, Email) VALUES (8, 1031, '学生4', '123@4');
INSERT INTO teacher.research (ResearchID, TeacherID, Title, Description, Date) VALUES (1, 1, '科研成果1', '科研成果1的描述', '2024-06-01');
INSERT INTO teacher.research (ResearchID, TeacherID, Title, Description, Date) VALUES (2, 1, '科研成果2', '科研成果2的描述', '2024-06-02');
INSERT INTO teacher.research (ResearchID, TeacherID, Title, Description, Date) VALUES (3, 2, '研究成果31', '研究成果描述3', '2024-06-03');
INSERT INTO teacher.research (ResearchID, TeacherID, Title, Description, Date) VALUES (5, 2, '研究成果6', '研究成果6', '2024-06-17');
INSERT INTO teacher.research (ResearchID, TeacherID, Title, Description, Date) VALUES (10, 650, '
产业大脑的全景式知识演化图谱智能构建技术研究', '项目来源：国家级项目课题
担任角色：负责
项目类别：纵向项目
项目状态：进行中', '2025-10-31');
INSERT INTO teacher.research (ResearchID, TeacherID, Title, Description, Date) VALUES (11, 650, '智慧社区治理模式及治理软件测试平台搭建', '项目来源：国家级项目子课题
担任角色：负责
项目类别：纵向项目
项目状态：进行中', '2024-12-31');
INSERT INTO teacher.research (ResearchID, TeacherID, Title, Description, Date) VALUES (12, 650, '
基于模型驱动方法与软构件的企业管理应用软件开发平台', '排名第6
所获奖项：黑龙江省科技进步一等奖', '2010-01-01');
INSERT INTO teacher.research (ResearchID, TeacherID, Title, Description, Date) VALUES (13, 650, '基于时间-成本双主线的CERP系统', '排名第4所获奖项：黑龙江省科技进步二等奖', '2005-01-01');
INSERT INTO teacher.research (ResearchID, TeacherID, Title, Description, Date) VALUES (14, 1035, '标题', '成果内容', '2024-06-30');
INSERT INTO teacher.research (ResearchID, TeacherID, Title, Description, Date) VALUES (15, 1035, '标题1', '成果内容1', '2024-06-30');
INSERT INTO teacher.schedule (ScheduleID, TeacherID, Date, TimeSlot) VALUES (1, 3, '2024-06-19', 'afternoon');
INSERT INTO teacher.schedule (ScheduleID, TeacherID, Date, TimeSlot) VALUES (7, 1, '2024-06-21', 'afternoon');
INSERT INTO teacher.schedule (ScheduleID, TeacherID, Date, TimeSlot) VALUES (8, 1, '2024-06-20', 'morning');
INSERT INTO teacher.schedule (ScheduleID, TeacherID, Date, TimeSlot) VALUES (9, 1, '2024-06-20', 'afternoon');
INSERT INTO teacher.schedule (ScheduleID, TeacherID, Date, TimeSlot) VALUES (10, 1, '2024-06-25', 'morning');
INSERT INTO teacher.schedule (ScheduleID, TeacherID, Date, TimeSlot) VALUES (11, 1, '2024-06-25', 'afternoon');
INSERT INTO teacher.schedule (ScheduleID, TeacherID, Date, TimeSlot) VALUES (12, 1, '2024-06-26', 'afternoon');
INSERT INTO teacher.schedule (ScheduleID, TeacherID, Date, TimeSlot) VALUES (13, 1, '2024-06-27', 'afternoon');
INSERT INTO teacher.schedule (ScheduleID, TeacherID, Date, TimeSlot) VALUES (14, 1, '2024-06-28', 'evening');
INSERT INTO teacher.schedule (ScheduleID, TeacherID, Date, TimeSlot) VALUES (19, 650, '2024-06-28', 'afternoon');
INSERT INTO teacher.schedule (ScheduleID, TeacherID, Date, TimeSlot) VALUES (20, 650, '2024-06-29', 'evening');
INSERT INTO teacher.schedule (ScheduleID, TeacherID, Date, TimeSlot) VALUES (21, 650, '2024-06-30', 'morning');
INSERT INTO teacher.schedule (ScheduleID, TeacherID, Date, TimeSlot) VALUES (22, 650, '2024-06-30', 'afternoon');
INSERT INTO teacher.schedule (ScheduleID, TeacherID, Date, TimeSlot) VALUES (23, 650, '2024-06-30', 'evening');
INSERT INTO teacher.schedule (ScheduleID, TeacherID, Date, TimeSlot) VALUES (32, 650, '2024-06-25', 'afternoon');
INSERT INTO teacher.appointments (AppointmentID, StudentID, TeacherID, Date, Place, AppointmentTime) VALUES (2, 1, 1, '2024-06-17', 'office', 'morning');
INSERT INTO teacher.appointments (AppointmentID, StudentID, TeacherID, Date, Place, AppointmentTime) VALUES (4, 1, 1, '2024-06-22', 'library', 'afternoon');
INSERT INTO teacher.appointments (AppointmentID, StudentID, TeacherID, Date, Place, AppointmentTime) VALUES (5, 2, 2, '2024-06-17', 'classroom', 'afternoon');
INSERT INTO teacher.appointments (AppointmentID, StudentID, TeacherID, Date, Place, AppointmentTime) VALUES (16, 7, 1, '2024-06-30', 'library', 'evening');
INSERT INTO teacher.appointments (AppointmentID, StudentID, TeacherID, Date, Place, AppointmentTime) VALUES (17, 7, 650, '2024-06-25', 'office', 'evening');
INSERT INTO teacher.appointments (AppointmentID, StudentID, TeacherID, Date, Place, AppointmentTime) VALUES (18, 7, 650, '2024-06-26', 'classroom', 'morning');
INSERT INTO teacher.appointments (AppointmentID, StudentID, TeacherID, Date, Place, AppointmentTime) VALUES (19, 7, 650, '2024-06-27', 'library', 'morning');
INSERT INTO teacher.appointments (AppointmentID, StudentID, TeacherID, Date, Place, AppointmentTime) VALUES (22, 1, 1035, '2024-06-28', 'classroom', 'evening');
INSERT INTO teacher.appointments (AppointmentID, StudentID, TeacherID, Date, Place, AppointmentTime) VALUES (23, 1, 1035, '2024-06-29', 'library', 'morning');
INSERT INTO teacher.appointments (AppointmentID, StudentID, TeacherID, Date, Place, AppointmentTime) VALUES (24, 8, 650, '2024-06-25', 'library', 'morning');
