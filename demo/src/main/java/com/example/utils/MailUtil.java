package com.example.utils;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

//type = 0 ѧ��ע��ɹ�
//type = 1 ԤԼ�ɹ�
//type = 2 ԤԼɾ��֪ͨ
public class MailUtil {
	public static Session sendEmail(String email, String detail, int type) {
		// 1.�������Ӷ���javax.mail.Session
		// 2.�����ʼ����� javax.mail.Message
		// 3.����һ�⼤���ʼ�
		String from = "3338329165@qq.com";// �����˵�������
		String host = "smtp.qq.com"; // ָ�������ʼ�������smtp.qq.com(QQ)|smtp.163.com(����)
		String code = "aumftytpsgdpcgjd"; // �����������˺š���Ȩ��

		Properties properties = System.getProperties();// ��ȡϵͳ����

		properties.setProperty("mail.smtp.host", host);// �����ʼ�������
		properties.setProperty("mail.transport.protocol", "smtp");
		// properties.setProperty("mail.smtp.port", "587");  //����Ҫ Ĭ�϶˿�
		properties.setProperty("mail.smtp.auth", "true");// ����֤
		// properties.put("mail.smtp.socketFactory", "javax.net.ssl.SSLSocketFactory");

		try {
			// QQ������Ҫ������δ��룬163���䲻��Ҫ
			MailSSLSocketFactory sf = new MailSSLSocketFactory();
			sf.setTrustAllHosts(true);
			properties.put("mail.smtp.ssl.enable", "true");
			properties.put("mail.smtp.ssl.socketFactory", sf);
			properties.put("mail.smtp.ssl.protocols", "TLSv1.2"); //�������������

			// 1.��ȡĬ��session����
			Session session = Session.getDefaultInstance(properties, new Authenticator() {
				@Override
				public PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(from, code);
				}
			});

			session.setDebug(true);

			//2��ͨ��session�õ�transport����
			Transport transport = session.getTransport();
			//3��ʹ���û�������Ȩ�������ʼ�������
			transport.connect(host, from, code);

			// 4.�����ʼ�����
			Message message = new MimeMessage(session);
			// 4.1���÷�����
			message.setFrom(new InternetAddress(from));
			// 4.2���ý�����
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			// 4.3�����ʼ�����
			String title = "���Ա���";
			if (type == 0) {
				title = "��ӭ��ע���ʦ��Ϣ����ϵͳ��";
			} else if (type == 1) {
				title = "ԤԼ�ɹ�";
			}
			message.setSubject(title);
			// 2.4�����ʼ�����
			String content = "";
			if (type == 0) {
				String[] details = detail.split(",");
				String username = details[0];
				String password = details[1];
				String name = details[2];
				content = "�𾴵� " +
						name +
						" ͬѧ��\n" +
						"��ӭ���ɹ�ע���ʦ��Ϣ����ϵͳ��\n" +
						"���Ƿǳ��������������ǵĴ��ͥ����Ϊע��ɹ����³�Ա�������ڿ�����������ϵͳ�ĸ��ֹ��ܺͷ���\n" +
						"1. �鿴��ʦ��Ϣ�������������λ�����ʦ�ĸ������ϡ���ѧ�����רҵ���ܡ�\n" +
						"2. ��ʦԤԼ��������ԤԼ���ǵĽ�ʦ�Ŀγ̣��������ǽ���һ��һ��ѧϰ������\n" +
						"���ĵ�¼ƾ֤���£�\n" +
						"�û�����" +
						username +
						"\n" +
						"���룺" +
						password +
						"\n\n" +
						"�����Ʊ������ĵ�¼ƾ֤������й¶�����ˡ������κ����ʻ���Ҫ����������ʱ��ϵ���ǵĿͷ��Ŷӣ����ǽ��߳�Ϊ���ṩ֧�֡�\n\n" +
						"�ٴθ�л����ע�ᣡ������һͬŬ������ͬ�ɳ���\n\n" +
						"ףѧҵ�гɣ�������죡\n\n" +
						"��ʦ��Ϣ����ϵͳ�Ŷ�";
			} else if (type == 1) {
				String[] details = detail.split(",");
				String studentName = details[0];
				String teacherName = details[1];
				String date = details[2];
				String time = convertToChinese(details[3]);
				String place = convertToChinese(details[4]);

				content = "�𾴵� " +
						studentName +
						" ͬѧ��\n" +
						"���ã����ѳɹ�ԤԼ " +
						teacherName +
						" ��ʦ�Ŀγ̡�\n" +
						"ԤԼ�������£�\n" +
						"���ڣ�" +
						date +
						"\n" +
						"ʱ�䣺" +
						time +
						"\n" +
						"�ص㣺" +
						place +
						"\n\n" +
						"�밴ʱǰ��ָ���ص�μӿγ̡�\n\n" +
						"�����κ����ʻ���Ҫ��һ���İ���������ʱ��������ϵ��\n\n" +
						"лл����ԤԼ��ף��ѧϰ��죡\n\n" +
						"��ʦ��Ϣ����ϵͳ�Ŷ�";
			}
			message.setContent(content, "text/html;charset=UTF-8");

			//5�������ʼ�
			transport.sendMessage(message, message.getAllRecipients());
			//6���ر�����
			transport.close();
			System.out.println("�ʼ��ɹ�����!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String convertToChinese(String variable) {
		switch (variable) {
			case "morning":
				return "����";
			case "afternoon":
				return "����";
			case "evening":
				return "����";
			case "office":
				return "�칫��";
			case "library":
				return "ͼ���";
			case "classroom":
				return "����";
			default:
				return "δ֪";
		}
	}
}