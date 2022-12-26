@echo off

@echo Enabling SQLServer default instance
netsh advfirewall firewall show rule name="SQL Server" || netsh advfirewall firewall add rule name="SQL Server" dir=in action=allow protocol=any

@echo Enabling port for SQL Server Browser Service
netsh advfirewall firewall show rule name="SQL Browser" || netsh advfirewall firewall add rule name="SQL Browser" dir=in action=allow protocol=any

@echo Allowing multicast broadcast response on UDP (Browser Service Enumerations OK)
netsh firewall set multicastbroadcastresponse ENABLE
