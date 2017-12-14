import com.sun.btrace.AnyType;
import com.sun.btrace.annotations.*;
import static com.sun.btrace.BTraceUtils.*;

@BTrace
public class Trace {

  @OnTimer(5000)
  public static void onTick() {
    println(concat("tick: ", str(timestamp())));
  }

  @OnMethod(
    clazz="/.*/",
    method="randomize"
  )
  public static void onPrintMethod(
    @ProbeClassName String probeClass,
    @ProbeMethodName String probeMethod) {
    println(strcat(probeClass, probeMethod));
  }

  @OnMethod(
    clazz="App",
    method="increment"
  )
  public static void onCall(AnyType[] args) {
    printArray(args);
    println(concat("in: ", str(args[0])));
  }

  @OnMethod(
    clazz="App",
    method="increment",
    location=@Location(Kind.RETURN)
  )
  public static void onReturn(@Return int value) {
    println(concat("out: ", str(value)));
  }

}
