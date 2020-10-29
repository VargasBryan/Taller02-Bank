package com.bank;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Log {

    File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
	String typeA = "Transferencia";
	String typeB = "Retiro";
    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
    pointcut success() : call(* money*(..));
    after() : success() {
    	BufferedWriter bw;
    	String typeSpanish;
    	try{
    		String type = thisJoinPointStaticPart.getSignature().getName();
    		bw = new BufferedWriter(new FileWriter(file,true));
    		if(thisJoinPointStaticPart.getSignature().getName().equals("moneyMakeTransaction")) {
    			typeSpanish = typeA;
    		}else {
    			typeSpanish = typeB;
    		}
    		bw.write("Tipo de transacción: " + typeSpanish + "\n");
    		System.out.println("Tipo de transacción: " + typeSpanish);
    		bw.write("Hora: "+ cal.HOUR + "\n");
    		System.out.println("Hora: "+ cal.HOUR);
    		bw.close();
    		System.out.println("Transaccion realizada con éxito");
    	}catch(IOException e) {
    		System.out.println(e.getMessage());
   		}
    	
    }
}



