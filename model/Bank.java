package bankdao.model;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlElements;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.ArrayList;
import java.util.List;
@XmlRootElement(name = "bank")
public class Bank {
    @XmlElement(name = "name")
    private String name;

    @XmlElementWrapper(name = "departments")
    @XmlElement(name = "department")
    private List<Department> departments;

    @XmlElementWrapper(name = "accounts")
    @XmlElements({
            @XmlElement(name = "savingsAccount", type = SavingsAccount.class),
            @XmlElement(name = "creditAccount", type = CreditAccount.class)
    })
    private List<Account> accounts = new ArrayList<>();

    private int bank_id;
    private String bank_name;
    private String address;
    private String contact_number;

    public Bank() {

    }

    public Bank(int bank_id, String bank_name, String address, String contact_number) {
        this.bank_id = bank_id;
        this.bank_name = bank_name;
        this.address = address;
        this.contact_number = contact_number;
    }


    public void setBank_id(int bank_id) {
        this.bank_id = bank_id;
    }

    public String getBank_name() {
        return bank_name;
    }

    public void setBank_name(String bank_name) {
        this.bank_name = bank_name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact_number() {
        return contact_number;
    }

    public void setContact_number(String contact_number) {
        this.contact_number = contact_number;
    }

    @Override
    public String toString() {
        return "Bank{" +
                "bank_id=" + bank_id +
                ", bank_name='" + bank_name + '\'' +
                ", address='" + address + '\'' +
                ", contact_number='" + contact_number + '\'' +
                '}';
    }
  }
