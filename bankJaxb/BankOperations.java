package bankJaxb;

import bankdao.model.Bank;
import bankdao.model.CreditAccount;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import java.io.File;

public class BankOperations {
    public static void main(String[] args) {
        try {
            // Step 1: Create the JAXBContext
            JAXBContext jaxbContext = JAXBContext.newInstance(Bank.class);

            // Step 2: Create the Unmarshaller
            Unmarshaller unmarshaller = jaxbContext.createUnmarshaller();

            // Step 3: Specify the XML file path
            File xmlFile = new File("C:\\Users\\deviv\\IdeaProjects\\solvd-projects\\src\\main\\java\\bankJaxb\\bankJaxb.xml");

            // Step 4: Unmarshal the XML data into Java objects
            Bank bank = (Bank) unmarshaller.unmarshal(xmlFile);

            // Access the credit
            CreditAccount creditAccount = new CreditAccount();
            System.out.println("Credit Account Number: " + creditAccount.getCreditLimit());
            System.out.println("Credit Balance: " + creditAccount.getBalance());


        } catch (JAXBException e) {
            e.printStackTrace();
        }
    }
}