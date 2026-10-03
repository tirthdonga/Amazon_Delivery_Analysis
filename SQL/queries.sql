use amazon_delivery;

-- S2a — Total delay_days by service type, descending

select r.service_type , sum(greatest(d.actual_days - d.promised_days, 0)) as total_delay_days from deliveries d 
join routes r on d.route_id = r.route_id
group by r.service_type order by total_delay_days desc;

-- S2b — Routes with summed delay_days > 8

select d.route_id, sum(greatest(d.actual_days - d.promised_days, 0)) as total_delay_days from deliveries d 
group by d.route_id having total_delay_days > 8 order by total_delay_days desc;

-- S2c — Top two hubs by summed delay_days 

select d.hub, sum(greatest(d.actual_days - d.promised_days, 0)) as total_delay_days from deliveries d 
group by d.hub order by total_delay_days desc, d.hub asc limit 2;