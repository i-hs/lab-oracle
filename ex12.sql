-- ex 1
select e.employee_id, e.first_name,  j.job_id, j.job_title, jh.start_date, jh.end_date
from employees e, jobs j, job_history jh
where j.job_id = e.job_id      
                    and 
    jh.employee_id=e.employee_id; 
    
    
select e.employee_id, e.first_name,  j.job_id, j.job_title, jh.start_date, jh.end_date
from employees e     join jobs j on j.job_id = e.job_id  
                              join job_history jh on  jh.employee_id=e.employee_id; 
                              
-- ex2 
select d.department_id, d.department_name, d.manager_id, e.first_name
from employees e, departments d
where d.manager_id = e.employee_id (+);


-- 사번/이름/지역
select e.employee_id, 
        e.last_name, 
        d.department_name, 
        r.region_name, 
        l.city,
        c.country_id
from employees e, regions r, departments d, locations l, countries c
where e.department_id = d.department_id (+)
                and
        d.location_id = l.location_id (+)              and
        l.country_id = c.country_id (+)
                and
        c.region_id = r.region_id(+)
        
    order by employee_id;






