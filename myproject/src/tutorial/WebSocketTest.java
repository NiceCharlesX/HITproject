/*
   * Classname 
   * WebSocketTest
   * Version information
   * 2.2.3
   * Date
   * 11-21
   * Copyright notice
   */
package tutorial;

import java.io.*;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
@ServerEndpoint("/websocket")
public class WebSocketTest {
 
  @OnMessage
  public void onMessage(String message, Session session)
    throws IOException, InterruptedException {
   
    // Print the client message for testing purposes
    System.out.println("Received: " + message);
   
    // Send the first message to the client
    session.getBasicRemote().sendText("This is the first server message");
   
    // Send 3 messages to the client every 5 seconds
    int sentMessages = 0;
    while(sentMessages < 3){
      Thread.sleep(5000);
      session.getBasicRemote().
        sendText("This is an intermediate server message. Count: "
          + sentMessages);
      sentMessages++;
    }
   
    // Send a final message to the client
    session.getBasicRemote().sendText("This is the last server message");
  }
   
  @OnOpen
  public void onOpen() {
    System.out.println("Client connected");
  }
 
  @OnClose
  public void onClose() {
    System.out.println("Connection closed");
  }
}