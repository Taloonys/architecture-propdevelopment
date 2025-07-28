# Execution
* [apply roles](scripts/apply-roles.sh)
* [create users](scripts/create-users.sh)

# Roles table
| Роль           | Права роли                              | Группы пользователей                  |
|----------------|-----------------------------------------|---------------------------------------|
| cluster-admin  | Полный доступ ко всем ресурсам кластера | Архитекторы, старшие DevOps инженеры  |
| cluster-viewer | Только get, list, watch для кластера    | Разработчики, аналитики, тестировщики |
| secret-manager | Чтение секретов кластера                | ИБ, DevOps инженеры                   |
| log-viewer     | `pods/log` чтение                       | Техническая поддержка, операторы      |
