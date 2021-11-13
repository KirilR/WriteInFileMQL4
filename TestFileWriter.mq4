//+------------------------------------------------------------------+
//|                                               TestFileWriter.mq4 |
//|                        Copyright 2021, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
//void OnTick()
 // {
//---
   
//  }
//+------------------------------------------------------------------+

int start()
  {
  
   if(IsNewCandle())filewriter();
//----
   return(0);
  }
  
bool IsNewCandle()
{
   static int BarsOnChart=0;
	if (Bars == BarsOnChart)
	return (false);
	BarsOnChart = Bars;
	return(true);
}

void filewriter(){
string myFile = "testfile.csv";
int handler=FileOpen(myFile,FILE_READ|FILE_WRITE|FILE_CSV|FILE_ANSI);
FileSeek(handler,0,SEEK_END);
FileWrite(handler,"Current price",Close[1]);
FileClose(handler);


}
