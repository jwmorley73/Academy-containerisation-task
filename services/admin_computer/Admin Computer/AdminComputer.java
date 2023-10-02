import com.sun.net.httpserver.HttpServer;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpExchange;

import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.util.logging.ConsoleHandler;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AdminComputer {
    public static void main(String[] args) throws IOException {
        Logger logger = Logger.getLogger("SimpleHttpServer");
        logger.setLevel(Level.INFO);
        
        ConsoleHandler consoleHandler = new ConsoleHandler();
        consoleHandler.setLevel(Level.INFO);
        
        logger.addHandler(consoleHandler);
        
        HttpServer server = HttpServer.create(new InetSocketAddress(8080), 0);

        server.createContext("/passwords", new PasswordHandler(logger));

        server.start();
        String[] messages = {
                "Empire Strikes Back-end started!",
                "Connecting to the Death Star...",
                "Routing through the vents...",
                "Passing the Central Core...",
                "Connected to the Death Star!",
                "Syncing with Vader",
                "Synced with Vader",
                "Loading passwords from /passwords",
                "Server is up and running.",
                "Handling request...",
                "Response sent.",
                "Request processed successfully."
            };
        for (int i = 0; i< messages.length; i++) {
            logger.info(messages[i]);
        }
    }

    static class PasswordHandler implements HttpHandler {
         private final Logger logger;
         
          public PasswordHandler(Logger logger) {
            this.logger = logger;
        }
        
        @Override
        public void handle(HttpExchange exchange) throws IOException {
            OutputStream os = exchange.getResponseBody();
            
            String response = "Fake Database Password: C3PO-321?\n Candy Crush Password: SithLord123?\n find notes.txt";
            
            exchange.sendResponseHeaders(200, response.length());
            os.write(response.getBytes());
            
            os.close();
            exchange.close();
        }
    }
}
