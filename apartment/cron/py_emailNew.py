import smtplib
import sys
from datetime import datetime
 
 
def read_changed(filename):
 	with open (filename,"r") as logfile:
 		data=logfile.readlines()
 	return data
  
 
 
def noticeEMail(starttime, usr, psw, fromaddr, toaddr, files):
    """
    Sends an email message through GMail once the script is completed.  
    Developed to be used with AWS so that instances can be terminated 
    once a long job is done. Only works for those with GMail accounts.
    
    starttime : a datetime() object for when to start run time clock
 
    usr : the GMail username, as a string
 
    psw : the GMail password, as a string 
    
    fromaddr : the email address the message will be from, as a string
    
    toaddr : a email address, or a list of addresses, to send the 
             message to
    """
    print "email notice launched" 
    # Calculate run time
    runtime=datetime.now() - starttime
    
    # Initialize SMTP server
    server=smtplib.SMTP('smtp.gmail.com:587')
    server.starttls()
    server.login(usr,psw)
    
    # Send email
    senddate=datetime.strftime(datetime.now(), '%Y-%m-%d')
    subject="New Files added from Trenort today"
    m="Date: %s\r\nFrom: %s\r\nTo: %s\r\nSubject: %s\r\nX-Mailer: My-Mail\r\n\r\n" % (senddate, fromaddr, toaddr, subject)
    msg='''
    
    New Files: '''
    for i in files:
    	msg+="\r\n "+i
    
    server.sendmail(fromaddr, toaddr, m+msg)
    print "message sent"
    server.quit()
 
 
 

 
if __name__ == '__main__':
    # Start time of script
    print 'Number of arguments:', len(sys.argv), 'arguments.'
    print 'Argument List:', str(sys.argv)    
    starttime=datetime.now()
    usr=sys.argv[1]
    psw=sys.argv[2]
    filename=sys.argv[3]
    files=read_changed(filename)
    # Some long job...we'll count to 100,000,000
    count=0
    # Fill these in with the appropriate info...
    #urs='johnftolly@gmail.com'
    #psw=''
    fromaddr=usr
    toaddr=usr
 
    # Send notification email
    noticeEMail(starttime, usr, psw, fromaddr, toaddr, files)