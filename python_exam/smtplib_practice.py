import smtplib
from email.mime.text import MIMEText

me = 'abc@server.kr'  # 보내는 사람 메일 주소
you = 'def@server.com'  # 받는 사람 메일 주소
contents = '12월 20일에 동창회가 있으니 참석해주시기 바랍니다'
msg = MIMEText(contents, _charset='euc-kr')
msg['Subject'] = '동창회 모임'
msg['From'] = me
msg['To'] = you
server = smtplib.SMTP('smtp.gmail.com', 587)
server.ehlo()
server.starttls()
server.ehlo()
server.login("자신의 아이디", "패스워드")
server.sendmail(me, you, msg.as_string())
server.quit()
