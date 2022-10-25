public with sharing class WeekTwoHomework {
    // a query for a List of contacts and returns the Account Name and Industry as well.  Use a loop to print the name of each Contact’s Account Name
    public static void childToParentRelationshipQueries()
    {
        List<Contact> conList = [select Name, Email, AccountID, Phone, Account.Name, Account.Industry from Contact];

        for(Contact con : conList)
        {
            System.debug('Name of each Contact '+con.Name+' And its associated Account name :'+con.Account.Name);
        }
    }
// a query for a list of Accounts AND includes all their closed-won opportunities in a subquery. 
    public static void parentToChildRelationshipQueries()
    {
        List<Account> accList = [select Name, Rating, (select name, Amount from Opportunities where StageName = 'Closed Won') from Account];

        for(Account acc : accList)
        {
            System.debug('Account name is :'+acc.Name);

            for(Opportunity opp : acc.Opportunities)
            {
                System.debug('Name of each Account\'s Opportunity name :'+opp.Name);
            }
            
        }
    }
//A method that queries for Opportunity records that returns results in a map format
    public static void mapOfOpportunityRecords()
    {
        Map<Id, Opportunity> opportunityMap = new Map<Id, Opportunity>([select Name, StageName, CloseDate from Opportunity]);
        System.debug('Map of Opportunities are :'+opportunityMap);
    }
//An aggregate results query that returns an integer equal to the total number of open opportunities in your org.
    public static void aggregatesQuery()
    {
        Integer openOppsCount = [SELECT COUNT() FROM Opportunity WHERE StageName != 'Closed Won' OR StageName != 'Closed Lost' ];
		System.debug('We have ' + openOppsCount + ' Open Opportunities in our Org');
    }
    
}
