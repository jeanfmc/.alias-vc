
#Alias VC
aliasVC(){
 vc_version=0.0.1
 vc_help="Unexpected command, use 'vc help' to know more."
 vc_default="Tool used to managed this option: "
 vc_notAvailable="This command is not available to this option."
 vc_notImplemented="This command was not implemented."
 vc_desc_versionAvailable="Available Versions:"
 vc_desc_versionInstalled="Installed versions:"
 vc_desc_versionCurrent="Current version:"
 cmd_ls='ls'
 cmd_version='version'
 cmd_add='add'
 cmd_rm='rm'
 cmd_use='use'
 while : ; do
  case $1 in
   self) 
    case $2 in 
     $cmd_ls) echo $vc_desc_versionAvailable && cd $VC_PATH | git fetch --prune --tags --quiet && git tag --sort=-v:refname ;;
     $cmd_version) echo $vc_desc_versionCurrent && git describe --tags HEAD ;;
     $cmd_add) echo $vc_notAvailable ;;
     $cmd_rm) echo $vc_notAvailable ;;
     $cmd_use) git checkout tags/$3 --quiet ;;
     *) if [[ -z ${2+x} ]]; then echo "$(echo $vc_default) https://github.com/jeanfmc/.alias-vc" ; else echo $vc_help; fi ;;
    esac; echo "";
   ;;
   node) 
    if ! command -v nvm &> /dev/null; then
        echo "NVM is required to this command, install it first.";
    fi
    case $2 in 
     $cmd_ls) 
      if [ ${OSTYPE} == 'msys' ]; then 
        echo $vc_desc_versionAvailable && nvm list available; echo $vc_desc_versionInstalled && nvm list ;
      else 
        echo $vc_desc_versionAvailable && nvm ls-remote; echo $vc_desc_versionInstalled && nvm ls ;
      fi ;;
     $cmd_version) 
      if [ ${OSTYPE} == 'msys' ]; then 
        nvm list  | grep "*" ;
      else
        nvm current ;
      fi ;;
     $cmd_add) nvm install $3 ;;
     $cmd_rm) nvm uninstall $3 ;;
     $cmd_use) nvm use $3 ;;
     *) if [[ -z ${2+x} ]]; then echo "$(echo $vc_default) $(nvm --version)" ; else echo $vc_help; fi ;;
    esac; echo "";
   ;;
   python) 
    if ! command -v pyenv &> /dev/null; then
        echo "PyEnv is required to this command, install it first.";
    fi
    case $2 in 
     $cmd_ls) pyenv install --list && echo 'Installed versions:' && pyenv versions;;
     $cmd_version) echo "" && pyenv versions  | grep "*" ;;
     $cmd_add) pyenv install $3 ;;
     $cmd_rm) pyenv uninstall $3 ;;
     $cmd_use) pyenv global $3 $> /dev/null && pyenv local $3 $> /dev/null ;;
     *) if [[ -z ${2+x} ]]; then echo "$(echo $vc_default) $(pyenv --version)" ; else echo $vc_help; fi ;;
    esac; pyenv rehash; echo "";
   ;;
   java | kotlin | scala | groovy | concurnas | maven | mvnd | gradle | ant | sbt | leiningen | tomcat | groovyserv | grails | spark | dotty | cuba | asciidoctorj | ballerina | bpipe | btrace | ceylon | crash | cxf | doctoolchain | gaiden | glide | gradleprofiler | http4k | infrastructor | jbake | jbang | karaf | kscript | layrry | lazybones | micronaut | mulefd | pomchecker | springboot | sshoogr | vertx | visualvm) 
    if ! command -v sdk &> /dev/null; then
        echo "SDKMan is required to this command, install it first.";
    fi
    case $2 in 
     $cmd_ls) sdk list $1 ;;
     $cmd_version) sdk current $1 ;;
     $cmd_add) sdk install $1 $3 ;;
     $cmd_rm) sdk uninstall $1 $3 ;;
     $cmd_use) sdk default $1 $3 ;;
     *) if [ -z ${2+x} ]; then echo "$(echo $vc_default) $(sdk version)" ; else echo $vc_help; fi ;;
    esac; echo "";break;;
   version) echo "" && echo "Alias VC version $vc_version" && echo "" && break;;
   options)   
    echo ""
    echo "Engines:" 
    echo "  * self            - Alias VC <https://github.com/jeanfmc/.alias-vc>"
    echo ""
    echo "Compilers:" 
    echo "  * python          - Python <https://www.python.org/>"
    echo "  * node            - NodeJS <https://nodejs.org/>"
    echo "  * java            - Java <https://www.java.com/>"
    echo "  * kotlin          - Kotlin <https://kotlinlang.org/>"
    echo "  * scala           - Scala <http://www.scala-lang.org/>"
    echo "  * groovy          - Groovy <http://www.groovy-lang.org/>"
    echo "  * concurnas       - Concurnas <https://concurnas.com/>"
    echo ""
    echo "Build Automation Tools:" 
    echo "  * maven           - Maven <https://maven.apache.org/> (Java)"
    echo "  * mvnd            - Maven Daemon <https://github.com/mvndaemon/mvnd/> (Java)"
    echo "  * gradle          - Gradle <http://gradle.org/> (Java)"
    echo "  * ant             - Apache Ant <https://ant.apache.org/> (Java)"
    echo "  * sbt             - SBT <http://www.scala-sbt.org/> (Scala)"
    echo "  * leiningen       - Leiningen <http://leiningen.org/> (Clojure)"
    echo ""
    echo "Servers:" 
    echo "  * tomcat          - Apache Tomcat <https://tomcat.apache.org/> (Java)"
    echo "  * groovyserv      - GroovyServ <https://kobo.github.io/groovyserv/> (Groovy)"
    echo ""
    echo "Frameworks:" 
    echo "  * grails          - Grails <https://grails.org/>"
    echo "  * spark           - Spark <https://spark.apache.org/>"
    echo "  * dotty           - Dotty <https://dotty.epfl.ch/>"
    echo "  * cuba            - CUBA CLI <https://cuba-platform.com/>"
    echo ""
    echo "Other Tools:" 
    echo "  * asciidoctorj    - AsciidoctorJ <http://asciidoctor.org/>"
    echo "  * ballerina       - Ballerina <https://ballerina.io/>"
    echo "  * bpipe           - Bpipe <http://bpipe.org/>"
    echo "  * btrace          - BTrace <https://github.com/btraceio/btrace>"
    echo "  * ceylon          - Ceylon <http://ceylon-lang.org/>"
    echo "  * crash           - CRaSH <http://www.crashub.org/>"
    echo "  * cxf             - CXF <https://cxf.apache.org/>"
    echo "  * doctoolchain    - docToolchain <https://doctoolchain.github.io/docToolchain/>"
    echo "  * gaiden          - Gaiden <http://kobo.github.io/gaiden/>"
    echo "  * glide           - Glide <http://glide-gae.appspot.com/>"
    echo "  * gradleprofiler  - Gradle profiler <https://github.com/gradle/gradle-profiler>"
    echo "  * http4k          - http4k <http://http4k.org/>"
    echo "  * infrastructor   - Infrastructor <http://infrastructor.io/>"
    echo "  * jbake           - JBake <http://jbake.org/>"
    echo "  * jbang           - J'Bang <http://github.com/maxandersen/jbang/>"
    echo "  * karaf           - Karaf <https://karaf.apache.org/>"
    echo "  * kscript         - kscript <https://github.com/holgerbrandl/kscript>"
    echo "  * layrry          - Layrry <https://github.com/moditect/layrry/>"
    echo "  * lazybones       - Lazybones <https://github.com/pledbrook/lazybones/>"
    echo "  * micronaut       - Micronaut <http://micronaut.io/>"
    echo "  * mulefd          - Mule Flow Diagrams <https://github.com/manikmagar/mule-flow-diagrams/>"
    echo "  * pomchecker      - Pomchecker <https://github.com/kordamp/pomchecker/>"
    echo "  * springboot      - Spring Boot CLI <http://projects.spring.io/spring-boot/>"
    echo "  * sshoogr         - Sshoogr <https://github.com/aestasit/sshoogr>"
    echo "  * vertx           - Vert.x <http://vertx.io/>"
    echo "  * visualvm        - VisualVM <https://visualvm.github.io/>"
   break;;
   *)
    if [[ -z ${1+x} || ${1} == "help" ]]; then
     echo "Alias VC - Version Controller:"
     echo ""
     echo "Commun Option Commands:"
     echo "  vc <option> $cmd_ls                  list all available version options"
     echo "  vc <option> $cmd_add [<version>]     install the version - empty will install the lasted version"
     echo "  vc <option> $cmd_rm <version>        uninstall the version"
     echo "  vc <option> $cmd_use <version>       define the version as default"
     echo "  vc <option> $cmd_version             show the currect version"
     echo "  vc <option>                     show the informations about the tool used to manage the versions"
     echo ""
     echo "Alias VC Commands:"
     echo "  vc options                      list the options supported by this alias"
     echo "  vc version                      alias vc version"
     echo "  vc [help]                       present the list of alias vc commands"
     echo ""
    else echo $vc_help; fi ;break;;
   esac;
  break; 
  done
}
alias vc=aliasVC
