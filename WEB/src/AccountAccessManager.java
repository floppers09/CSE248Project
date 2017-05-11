import com.sun.media.jfxmedia.logging.Logger;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.naming.directory.InvalidAttributeIdentifierException;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.io.*;

/**
 * Created by Alex on 5/3/2017.
 */
@Path("/account")
public class AccountAccessManager {

    @POST
    @Path("/register")
    @Consumes(MediaType.TEXT_PLAIN)
    @Produces(MediaType.TEXT_PLAIN)
    public String register(String jsonString) {
        JsonObject jsonObject = Json.createReader(new StringReader(jsonString)).readObject();
        // TODO check for validity and availability of entered information
        JsonObjectBuilder registrationErrorBuilder = Json.createObjectBuilder();
        boolean error = false;
        if (LifecycleBean.accountsBag.usernameInUse(jsonObject.getString("username"))) {
            registrationErrorBuilder.add("username", "Username is already in use");
            error = true;
        }
//        if (!jsonObject.getString("email").matches("(\\S+@\\w+\\.\\S+)")) {
//            registrationErrorBuilder.add("email", "This is not a valid email address");
//            error = true;
//        }
        if (error) {
            return registrationErrorBuilder.build().toString();
        }
        try {
            // TODO change this to just pass through the jsonObject
            LifecycleBean.accountsBag.addAccount(new Account(
                    jsonObject.getString("username"),
                    jsonObject.getString("password"),
                    jsonObject.getString("email"),
                    jsonObject.getString("account")
            ));
        } catch (InvalidAttributeIdentifierException ex) {
            return "Registration failed";
        }
        return "Register Successful";
    }

    @POST
    @Path("/login")
    @Consumes(MediaType.TEXT_PLAIN)
    @Produces(MediaType.TEXT_PLAIN)
    public String login(String jsonString) {
        JsonObject jsonObject = Json.createReader(new StringReader(jsonString)).readObject();
        String username = jsonObject.getString("username");
        String password = jsonObject.getString("password");
        if (LifecycleBean.accountsBag.verifyLogin(username, password)) {
            JsonObject json = Json.createObjectBuilder()
                    .add("url", (LifecycleBean.accountsBag.getUser(username).getProfile() instanceof Customer ? "homepage/" : "homepage-establishment/"))
                    .add("token", LifecycleBean.tokenManager.assignNewToken(username))
                    .add("account", LifecycleBean.accountsBag.getUser(username).toJson())
                    .build();
            return json.toString();
        } else
            return "Login Failed";
    }

    @POST
    @Path("/signOut")
    @Consumes(MediaType.TEXT_PLAIN)
    public void signOut(String token) {
        LifecycleBean.tokenManager.removeUser(token);
    }

    @POST
    @Path("/token")
    @Consumes(MediaType.TEXT_PLAIN)
    @Produces(MediaType.TEXT_PLAIN)
    public String getUserFromToken(String token) {
        String username = LifecycleBean.tokenManager.getUsername(token);
        if (username == null) {
            return "Token Not Found";
        }
        Account account = LifecycleBean.accountsBag.getUser(username);
        if (account == null) {
            return "Username Not Found";
        }
        return account.toJson().toString();
    }
}
