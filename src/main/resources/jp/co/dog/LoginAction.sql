select_user_name=
select
  ua.user_name,
  ua.pass,
  sa.user_lock
from
  user_account ua
inner join
  system_account sa
on
  sa.user_id = ua.user_id
where
  ua.user_id = :id
  and :systemDate between sa.from_date and sa.to_date