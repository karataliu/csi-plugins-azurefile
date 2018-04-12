#!/bin/bash

if [ ! -z "$CSI_SOCKET" ]; then
    rm $CSI_SOCKET
    socat -d UNIX-LISTEN:$CSI_SOCKET,fork TCP4:127.0.0.1:10000 2> /tmp/so.log &
fi

dotnet /opt/csi-azurefile/Csi.Plugins.AzureFile.dll
