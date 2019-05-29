search=
select
  ua.user_id as userId,
  ua.user_name as userName,
  sa.user_lock as userLock
from
  user_account ua
inner join
  system_account sa
on
  sa.user_id = ua.user_id
where
  $if (id) {ua.user_id like :id%}
  and $if (userName) {ua.user_name like :userName%}
