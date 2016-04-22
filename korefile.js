var solution = new Solution('New Project');
var project = new Project('New Project');
project.targetOptions = {"flash":{},"android":{}};
project.setDebugDir('build/linux');
project.addSubProject(Solution.createProject('build/linux-build'));
project.addSubProject(Solution.createProject('/home/varomix/dev/Kha'));
project.addSubProject(Solution.createProject('/home/varomix/dev/Kha/Kore'));
solution.addProject(project);
return solution;
