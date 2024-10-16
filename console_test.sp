#include <sourcemod>
#include <sdktools>

new DownloadProgressPosition[65];

public OnPluginStart(){
}

public bool:OnClientConnect(client, String:Reject[], Len)
{
	CreateTimer(5.0, CheckIfClientNeedsToDownload, client, 0);
	return true;
}

public Action:CheckIfClientNeedsToDownload(Handle:timer, any:client)
{
	if (IsClientInGame(client))
	{
		return Action:0;
	}
	if (!IsClientConnected(client))
	{
		return Action:0;
	}
	StartToDownload(client);
	return Action:0;
}

StartToDownload(client)
{
	CreateTimer(1.0, ShowDownload, client, 1);
	CreateTimer(1.0, ClearIt, client, 1);
	DownloadProgressPosition[client] = 0;
	return 0;
}

public Action:ClearIt(Handle:timer, any:client)
{
	if (IsClientInGame(client))
	{
		return Action:4;
	}
	if (!IsClientConnected(client))
	{
		return Action:4;
	}
	ClientCommand(client, "con_enable 1");  
	ClientCommand(client, "showconsole");
	return Action:0;
}

public Action:ShowDownload(Handle:timer, any:client)
{
	if (IsClientInGame(client))
	{
		return Action:0;
	}
	if (!IsClientConnected(client))
	{
		return Action:0;
	}
	DownloadProgressPosition[client]++;
	ClientCommand(client, "play UI/beep07.wav"); 
	new String:message[3048];
	new x;
	while (DownloadProgressPosition[client] > x)
	{
		StrCat(message, 3048, "■");
		
		if (x == 30 || x == 61 || x == 92 || x == 123 || x == 154 || x == 185 || x == 216)
		{
			StrCat(message, 3048, "\n         ");
		}
		x++;
	}
	Format(message, 3048, "%s❏", message);
	ReplyToCommand(client, "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	ReplyToCommand(client, "|                  ▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬                    |");
	ReplyToCommand(client, "|                                                        	|");
	ReplyToCommand(client, "|                  DESCARGA EN PROGRESO	                 	|");
	ReplyToCommand(client, "         %s", message);
	ReplyToCommand(client, "|                                                        	|");
	ReplyToCommand(client, "|                                                        	|");
	ReplyToCommand(client, "|        ░░░░░░███████ ]▄▄▄▄▄▄▄▄   ---○ ❏ＧＵＮ⋆ＧＡＭＥ❏       |");
	ReplyToCommand(client, "|         ▂▄▅█████████▅▄▃▂                                  |");
	ReplyToCommand(client, "|         I███████████████████].                            |");
	ReplyToCommand(client, "|          ◥⊙▲⊙▲⊙▲⊙▲⊙▲⊙▲⊙◤...                           |");
	ReplyToCommand(client, "|                                                        |");
	ReplyToCommand(client, "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	ReplyToCommand(client, "\n");
	ReplyToCommand(client, "\n");
	ReplyToCommand(client, "\n");
	ReplyToCommand(client, "\n");
	ReplyToCommand(client, "\n");
	ReplyToCommand(client, "\n");
	ReplyToCommand(client, "\n");
	ReplyToCommand(client, "\n");
	ReplyToCommand(client, "\n");
	ReplyToCommand(client, "\n");
	ReplyToCommand(client, "\n");
	ReplyToCommand(client, "\n");
	ReplyToCommand(client, "\n");
	ReplyToCommand(client, "\n");
	ReplyToCommand(client, "\n");
	ReplyToCommand(client, "\n");
	return Action:0;
}

