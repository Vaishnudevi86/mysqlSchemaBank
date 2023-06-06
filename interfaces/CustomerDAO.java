package bankdao.interfaces;

import bankdao.model.Customer;

import java.util.List;

public interface CustomerDAO {
    List<Customer> getAllCustomer();
    Customer getCustomerById(int id);
    void save(Customer customer);
    void update(Customer customer);
    void delete(Customer customer);
}
