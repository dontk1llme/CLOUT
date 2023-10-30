package com.mmm.clout.userservice.common.entity.sms;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;
import org.springframework.stereotype.Service;

@Service
public class SmsService {

    public final static String SENDNUM = "010-6208-0637";
    public final static String FORM = "아래의 인증번호를 입력해 주세요\n";

    public String smsSend(String number, String sendKey) {
        DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCSJ7HUQJPIEA5BA", "TWFJAU6CNXSK5CCKW65RX5MKSAHENIOL", "https://api.coolsms.co.kr");
        // Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
        Message message = new Message();
        message.setFrom(SENDNUM);
        message.setTo(number);
        message.setText(FORM + sendKey);
        try {
            // send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
            messageService.send(message);
        } catch (NurigoMessageNotReceivedException exception) {
            // 발송에 실패한 메시지 목록을 확인할 수 있습니다!
            System.out.println(exception.getFailedMessageList());
            System.out.println(exception.getMessage());
        } catch (Exception exception) {
            System.out.println(exception.getMessage());
        }
        return sendKey;
    }

}
