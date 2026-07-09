public with sharing class firstScenario {
    public firstScenario() {

    }

    /**
     1. Same-Record Field Updates (no other objects involved)
        Auto-populate a field based on other fields on the same record (e.g., concatenate First + Last Name into Full Name)
        Default a field value on insert if blank
        Auto-calculate a field (e.g., Amount × Probability = Weighted Amount on Opportunity)
        Format/normalize data before save (e.g., uppercase a Phone or Email field)
        Auto-generate a unique code/number (like an invoice number) on insert
     */

     // Example 1: Auto-populate a field based on other fields on the same record
    public static void autoPopulateFullName(List<Parent__c> parents) {
        for (Parent__c parent : parents) {
            if (String.isBlank(parent.Full_Name__c)) {
                parent.Full_Name__c = parent.First_Name__c + ' ' + parent.Last_Name__c;
            }
        }
    }

    // Example 2: Default a field value on insert if blank
    public static void defaultFieldValue(List<Parent__c> parents) {
        for (Parent__c parent : parents) {
            if (String.isBlank(parent.Text_Message__c)) {
                parent.Text_Message__c = 'Default Value';
            }
        }
        
    }

    // Example 3: Auto-calculate a field (e.g., Amount × Probability = Weighted Amount on Opportunity)
    public static void autoCalculateWeightedAmount(List<Parent__c> parents) {
        for (Parent__c parent : parents) {
            if (parent.Amount__c != null && parent.Probability__c != null) {
                parent.Weighted_Amount__c = parent.Amount__c * parent.Probability__c;
            }   
        }
    }
    
    // Example 4: Format/normalize data before save (e.g., uppercase a Phone or Email field)
    public static void formatEmail(List<Parent__c> parents) {
        for (Parent__c parent : parents) {
            if (parent.Email__c != null) {
                parent.Email__c = parent.Email__c.toUpperCase();
            }
        }
    }

    // Example 5: Auto-generate a unique code/number (like an invoice number) on insert
    public static void autoGenerateUniqueCode(List<Parent__c> parents) {
        for (Parent__c parent : parents) {
            if (String.isBlank(parent.Unique_Code__c)) {
                parent.Unique_Code__c = 'INV-' + String.valueOf(System.currentTimeMillis());
            }
        }
    }           
 
}    