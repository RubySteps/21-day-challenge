Going to write a system procedure for 

1. sucking out suppliers from mssql database, 
2. then suck out all of their assigned tasks for a given period, 
3. save as filterable excel file or PDF
4. save all of the files to a local windows share
5. email each supplier their particular file (frequency TBD)
6. Setup crontab to implement.

Going to need a timeframe: minus 7 days plus 30 days.

Create constants for START_DATE and END_DATE with date/time

def get_all_suppliers; end
def get_all_assigned_tasks; end
def create_filterable spreadsheet; end
def email_supplier; end
def send_status_report; end
