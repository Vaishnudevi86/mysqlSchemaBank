package bankdao.model;

import javax.xml.bind.annotation.*;
import java.util.List;

@XmlAccessorType(XmlAccessType.FIELD)
public class SavingsAccount extends Account {
    @XmlElement(name = "interestRate")
    private double interestRate;

    @XmlElementWrapper(name = "holders")
    @XmlElement(name = "holder")
    private List<String> holders;

    public SavingsAccount() {
    }

    public SavingsAccount(double interestRate, List<String> holders) {
        this.interestRate = interestRate;
        this.holders = holders;
    }

      public SavingsAccount(int account_id, int branch_id, String account_type, double balance, int account_holder_id) {
        super(account_id, branch_id, account_type, balance, account_holder_id);
    }

    // Getters and setters

    public double getInterestRate() {
        return interestRate;
    }

    public void setInterestRate(double interestRate) {
        this.interestRate = interestRate;
    }

    public List<String> getHolders() {
        return holders;
    }

    public void setHolders(List<String> holders) {
        this.holders = holders;
    }
}