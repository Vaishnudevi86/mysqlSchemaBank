package bankdao.interfaces;

import bankdao.model.Account;
import bankdao.model.Branch;

import java.util.List;

public interface BranchDAO {
    List<Branch> getAllBranch();
    Branch getBranchById(int id);
    void save(Branch branch);
    void update(Branch branch);
    void delete(Branch branch);
}


