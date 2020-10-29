import java.io.File;
import java.util.Calendar;

public aspect Aspectos_guia {

    File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
    pointcut success() : call(* create*(..) );
    after() : success() {
    	System.out.println("**** User created ****");
    }
}

/*
public aspect Logger {

    pointcut success() : call(* create*(..) );
    after() : success() {
    //Aspecto ejemplo: solo muestra este mensaje después de haber creado un usuario 
    	System.out.println("**** User created ****");
    }
    
}

*/