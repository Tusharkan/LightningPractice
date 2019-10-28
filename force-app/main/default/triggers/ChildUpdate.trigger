trigger ChildUpdate on Account (after insert, after update) {

    Map<id,String> maplist = new Map<id,String>();
    for(Account aa:Trigger.new)
    {
        maplist.put(aa.id,aa.Description);
    }
    List<Contact> con = new List<contact>();
    
    for(Contact cc: [select Description from Contact where Contact.AccountId IN : maplist.keySet()])
    {
        if(maplist.containsKey(cc.AccountId))
        {
             cc.Description = maplist.get(cc.AccountId);
            con.add(cc);
        }
    }
    update con;
}