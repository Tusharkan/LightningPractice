trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {
    
    List<BatchLeadConvertErrors__c > ll = new List<BatchLeadConvertErrors__c>();

    for(BatchApexErrorEvent bae : Trigger.new)
    {
        BatchLeadConvertErrors__c blc = new BatchLeadConvertErrors__c();
        
        blc.AsyncApexJobId__c = bae.AsyncApexJobId;
        blc.Records__c = bae.JobScope;
        blc.StackTrace__c = bae.StackTrace;
        
        ll.add(blc);
    }
    if(ll.size() > 0)
    {
        insert ll;
        String v1 = 'data inserted';
        System.debug(v1);
        /* output */
    }
}