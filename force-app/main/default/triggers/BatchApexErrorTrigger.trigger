trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {
    
    List<BatchLeadConvertErrors__c > ll = new List<BatchLeadConvertErrors__c>();

    for(BatchApexErrorEvent bae : Trigger.new)
    {
        BatchLeadConvertErrors__c blc = new BatchLeadConvertErrors__c();
        
        blc.AsyncApexJobId__c = bae.AsyncApexJobId;
        blc.Records__c = bae.JobScope;
        blc.StackTrace__c = bae.StackTrace;
        /* add to list */
        ll.add(blc);
    }
    if(ll.size() > 0)
    {
        insert ll;
        String v1 = 'data inserted into the list';
        System.debug(v1);
       System.debug('insert to git repository');
    }
}