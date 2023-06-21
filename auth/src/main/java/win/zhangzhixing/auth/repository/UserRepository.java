package win.zhangzhixing.auth.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import win.zhangzhixing.auth.model.entity.User;

import java.util.Optional;

/**
 * @author zhang
 */
@Repository
public interface UserRepository extends JpaRepository<User, String> {
    Optional<User> findByMobile(String mobile);
}
