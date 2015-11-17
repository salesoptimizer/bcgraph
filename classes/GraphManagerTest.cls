@isTest
private class GraphManagerTest {

    static testMethod void getQuarterDatesTest() {
        Integer year = 2015;
        GraphManager manager = new TotalGraphManager(null, year, 1);
        Map<String, Date> dates = new Map<String, Date>();
        dates.put('fstDate', Date.newInstance(year, 1, 1));
		dates.put('lstDate', Date.newInstance(year, 3, 31));
        system.assertEquals(dates, manager.getQuarterDates(year, 1));
        
        manager = new TotalGraphManager(null, year, 2);
        dates.put('fstDate', Date.newInstance(year, 4, 1));
		dates.put('lstDate', Date.newInstance(year, 6, 30));
        system.assertEquals(dates, manager.getQuarterDates(year, 2));
        
        manager = new TotalGraphManager(null, year, 3);
        dates.put('fstDate', Date.newInstance(year, 7, 1));
		dates.put('lstDate', Date.newInstance(year, 9, 30));
        system.assertEquals(dates, manager.getQuarterDates(year, 3));
        
        manager = new TotalGraphManager(null, year, 4);
        dates.put('fstDate', Date.newInstance(year, 10, 1));
		dates.put('lstDate', Date.newInstance(year, 12, 31));
        system.assertEquals(dates, manager.getQuarterDates(year, 4));
    }
}