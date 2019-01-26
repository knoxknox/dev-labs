// DI
//
// composition:
// object has no life independent of container.
//
// aggregation:
// object has an independent life of container.

class Composite
{
  public Composite()
  {
    this.dependency = new Dependency();
  }
}

class Aggregated
{
  public Aggregated(abstractDependency)
  {
    this.dependency = abstractDependency;
  }
}



// Root
//
// Composition Root compose modules together.
// Entire object graph finally composed at entry point.
// Example: (method 'main', global.asax, App.OnStartup).

var container = BuildContainer();
var rootModule = container.Resolve<RootModule>();
container.Release(rootModule); // use the rootModule



// Factory
//
// Pattern that deal with the problem of creating objects.
// Defining a separate method for creating different objects.

class User
{
  private string name;
  private object groups;

  public User(string name, object groups)
  {
    this.name = name;
    this.groups = groups;
  }
}

class Factory
{
  public static User Build(string name)
  {
    return new User(name, new List<int> {1000, 1001, 1002, 1003});
  }
}



// Ambient Context
//
// Pattern that make dependencies available for all classes/modules.
// Operates with abstraction (interface or abstract class), not the implementation.

Logger.Current.LogMessage("default");

Logger.Current = new ConsoleLogger();
Logger.Current.LogMessage("console");

interface ILogger
{
  void LogMessage(string msg);
}

class Logger
{
  static Logger()
  {
    Current = new DefaultLogger();
  }

  public static ILogger Current { get; set; }
}

class DefaultLogger : ILogger
{
  public void LogMessage(string msg)
  {
    Console.WriteLine("DefaultLogger#LogMessage");
  }
}

class ConsoleLogger : ILogger
{
  public void LogMessage(string msg)
  {
    Console.WriteLine("ConsoleLogger#LogMessage");
  }
}
