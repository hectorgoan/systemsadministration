#!/usr/bin/perl

use warnings;
#use strict;
use CGI qw(:standard);
use Email::Send::SMTP::Gmail;
use IPC::System::Simple qw(run);

#Recogida de argumentos
my $_nick;
$_nick = param('nick');
my $_email;
$_email = param('email');
my $_password;
$_password = param('password');
my $_hash;
$_hash = param('hash');

if ($_hash ne "SupaSecretPasswd") 
{
	die();
}

#Creacción user
	#Se hace necesario llamar al script desde linea de comandos, se intentaron múltiples formas de ejecutarlo (modulos sudo, por ejemplo) 
	#desde terminal funciona, pero llamando desde URL, estos módulos pierden los parámetros por el camino
	my $_parametros = "nick=".$_nick."&email=".$_email."&password=".$_password;
	
	my @args;
	@args = ("/usr/lib/cgi/EXTERNregisterUserInMoodle.pl", $_parametros);
	run("perl", @args);
