exec_sh()
{
	$@/setup.sh
}
exec_sh nginx_ssh
exec_sh ftps
exec_sh mysql
