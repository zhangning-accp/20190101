规则：
1. 站点名：site_1...n
2. 数据库名：site_1...n
3. site统一放到apache 默认的web根目录下
4. config.template.php放到和PhpConfig.py同目录下，生成的config_1..n.inc.php放在configs目录下
5. 站点源文件放在source/litecart目录下，这些文件需要拷贝到site-1...n目录。不要把litecart目录拷贝过去。
6. 修改client.htaccess文件第46行，把litecart修改为site1...n. 这些文件也放到configs目录下。然后将其替换site_n/public_html/.hccess文件
7. 修改admin.htaccess文件8,14行，修改/var/www/html/litecart为实际的站点路径,如/var/www/html/site_n 然后替换到原来的public_html/admin/.hccess文件

程序文件和sh文件介绍
PhpConfig.py：该文件主要是生成config_n.inc.php、client_n.htaccess、admin_n.htaccess文件。
create-site-and-db-data.sh:该文件主要是创建站点文件夹和数据文件夹，同时将web程序和数据文件拷贝到对应的目录下。

insert-data-to-site.sh:添加测试数据的sh。需要有site_assgin.sql文件