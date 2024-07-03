package pl.coderslab.user;

import java.util.Optional;

public interface UserService {

    User findByUserName(String name);

    void saveUser(User user);
}
