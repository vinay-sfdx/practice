public class AccountBatchUpdate implements Database.Batchable<sObject> {
  public Database.QueryLocator start(Database.BatchableContext bc) {
    // Fetch all accounts where Industry is null
    return Database.getQueryLocator([SELECT Id, Industry FROM Account WHERE Industry = NULL]);
  }

  public void execute(Database.BatchableContext bc, List<Account> scope) {
    for (Account acc : scope) {
      acc.Industry = 'Technology';
    }
    update scope; // Perform DML operation
  }

  public void finish(Database.BatchableContext bc) {
    System.debug('Batch Processing Completed');
  }
}
