/ help.q 2017.03.23T18:18:00.655
\d .help
DIR:TXT:()!()
display:{if[not 10h=abs type x;x:string x];$[1=count i:where(key DIR)like x,"*";-1 each TXT[(key DIR)[i]];show DIR];}
fetch:{if[not 10h=abs type x;x:string x];$[1=count i:where(key DIR)like x,"*";1_raze"\n",'TXT[(key DIR)[first i]];DIR]}
TXT,:(enlist`adverb)!enlist(
 "'    eachboth    each";
 "/    [x]over     over(:+*&|,)   [x]do/while";
 "\\    [x]scan     scan(:+*&|,)   [x]do\\while";
 "':   [x]prior    prior(:-%)";
 "/:   eachright   sv(i:i/:I s:`/:S C:c/:L) j:0x40/:X i:0x0/:X";
 "\\:   eachleft    vs(I:i\\:i S:`\\:s L:c\\:C) X:0x40\\:j X:0x0\\:i"
 )
DIR,:(enlist`adverb)!enlist`$"adverbs/operators"
TXT,:(enlist`attributes)!enlist(
 "example           overhead ";
 "`s#2 2 3 sorted   0 ";
 "`u#2 4 5 unique   16*u ";
 "`p#2 2 1 parted   (4*u;16*u;4*u+1) ";
 "`g#2 1 2 grouped  (4*u;16*u;4*u+1;4*n)";
 "";
 "The byte overheads use n(number of elements) and u(number of uniques)";
 "`u is for unique lists.";
 "`p and `g are for lists with a lot of repetition.";
 "";
 "`s#, `u# and `g# are preserved on append in memory (if possible)";
 "only `s# is preserved on append to disk"
 )
DIR,:(enlist`attributes)!enlist`$"data attributes"
TXT,:(enlist`cmdline)!enlist(
 "q [f] [-b] [-c r c] [-C r c] [-g 0|1] [-l] [-L][-o N] [-p N] [-P N] [-q]";
 "      [-r :H:P] [-s N] [-t N] [-T N] [-u|U F] [-w N] [-W N] [-z 0|1]";
 "";
 "f load script (*.q, *.k, *.s), file or directory";
 "";
 "-b               block client write access ";
 "-c r c           console maxRows maxCols";
 "-C r c           http display maxRows maxCols ";
 "-e [0|1|2]       disable|enable|display error trap clients";
 "-g [0|1]         disable|enable immediate garbage collect, default 0";
 "-l               log updates to filesystem ";
 "-L               as -l, but sync logging";
 "-o N             offset hours (from GMT: affects .z.Z/T/P/N), default 0";
 "-p N             port kdbc(/jdbc/odbc) http(html xml txt csv)";
 "-p -N            port multithreaded kdbc";
 "-P N             printdigits, default 7, 0=>all";
 "-q               quiet, no startup banner text";
 "-r :H:P          replicate from :host:port ";
 "-s N             slaves for parallel execution";
 "-S N             set random seed";
 "-t N             timer milliseconds, default 0 (=> none)";
 "-T N             timeout seconds(applies to all client queries), default 0 (=> none)";
 "-u F             usr:pwd file, no access above start directory";
 "-u [0|1]         enable|disable system escapes";
 "-U F             as -u, but no file restrictions";
 "-w N             workspace MB limit (default: 2*RAM)";
 "-W N             week offset, default 2, 0=>saturday";
 "-z [0|1]         \"D\" uses 0:mm/dd/yyyy or 1:dd/mm/yyyy, default 0"
 )
DIR,:(enlist`cmdline)!enlist`$"command line parameters"
TXT,:(enlist`data)!enlist(
 "char-size--type-literal--------------q---------sql--------java-------.net---  ";
 "b    1     1    0b                   boolean              Boolean    boolean   ";
 "g    16    2    0Ng                  guid                 UUID       GUID";
 "x    1     4    0x0                  byte                 Byte       byte      ";
 "h    2     5    0h                   short     smallint   Short      int16     ";
 "i    4     6    0                    int       int        Integer    int32     ";
 "j    8     7    0j                   long      bigint     Long       int64     ";
 "e    4     8    0e                   real      real       Float      single    ";
 "f    8     9    0.0                  float     float      Double     double    ";
 "c    1     10   \" \"                  char                 Character  char";
 "s    .     11   `                    symbol    varchar    String     string    ";
 "p    8     12   dateDtimespan        timestamp";
 "m    4     13   2000.01m             month";
 "d    4     14   2000.01.01           date      date       Date                 ";
 "z    8     15   dateTtime            datetime  timestamp  Timestamp  DateTime";
 "n    8     16   0D00:00:00.000000000 timespan";
 "u    4     17   00:00                minute";
 "v    4     18   00:00:00             second";
 "t    4     19   00:00:00.000         time      time       Time       TimeSpan ";
 "*    4     20.. `s$`                 enum";
 "           98                        table";
 "           99                        dict";
 "           100                       lambda";
 "           101                       unary prim";
 "           102                       binary prim";
 "           103                       ternary(operator)";
 "           104                       projection";
 "           105                       composition";
 "           106                       f'";
 "           107                       f/";
 "           108                       f\\";
 "           109                       f':";
 "           110                       f/:";
 "           111                       f\\:";
 "           112                       dynamic load";
 "";
 "the nested types are 77+t (e.g. 78 is boolean. 96 is time.)";
 "";
 "`char$data `CHAR$string";
 "";
 "The int, float, char and symbol literal nulls are: 0N 0n \" \" `.";
 "The rest use type extensions, e.g. 0Nd. No null for boolean or byte.";
 "0Wd 0Wz 0Wt  placeholder infinite dates/times/datetimes (no math)";
 "";
 "dict:`a`b!.. table:([]x:..;y:..) or +`x`y!..";
 "date.(datetime dd mm month timestamp uu week year) / .z.d";
 "datetime.(date dd hh minute mm month second ss time timespan timestamp uu week year) / .z.z";
 "time.(hh minute mm second ss timespan uu) milliseconds=time mod 1000 / .z.t";
 "timespan.(hh minute mm second ss time uu) / .z.n";
 "timestamp.(date datetime dd hh minute mm month second ss time timespan uu week year) / .z.p"
 )
DIR,:(enlist`data)!enlist`$"data types"
TXT,:(enlist`debug)!enlist(
 " `     browse the stack frame above";
 " .     browse the stack frame below";
 " 'str  throw str from the innermost stack frame";
 " .z.ex .z.ey  (set in the debugger) the failing primitive and its arglist, if available";
 ".Q.bt[]        print current stack trace (list of stack frames)";
 ".Q.sbt[x]      format a stack trace (stringify back trace)";
 ".Q.trp[f;x;g]  like @(trap), but g's second argument is a stack trace: g[error symbol;stack trace]"
 )
DIR,:(enlist`debug)!enlist`$"debug - debugger commands"
TXT,:(enlist`define)!enlist(
 "Dyad------------D-Amend---------Monad-----------M-amend------";
 "v:y             .[`v;();:;y]";
 "v+:y            .[`v;();+;y]    v-:             .[`v;();-:]";
 "v[i]+:y         .[`v;,i;+;y]    v[i]-:          .[`v;,i;-:]";
 "v[i;j]+:y       .[`v;(i;j);+;y] v[i;j]-:        .[`v;(i;j);-:]";
 "";
 "@[v;i;d;y] is .[v;,i;d;y]       @[v;i;m] is .[v;,i;m]";
 "";
 "{[a;b;c] ...}   function definition";
 " x y z          default parameters";
 " d:...          local variable";
 " d::..          global variable ";
 "";
 "control(debug: ctrl-c stop)";
 " $[c;t;f]       conditional";
 " ?[c;t;f]       boolean conditional";
 " if[c; ... ]";
 " do[n; ... ]";
 " while[c; ...]";
 " / ...          comment";
 " : ...          return(resume)";
 " ' ...          signal";
 "";
 "trap signals with .[f;(x;y;z);v] and @[f;x;v]";
 "or                .[f;(x;y;z);g] and @[f;x;g] ";
 "where v is the value to be returned on error ";
 "or g is a monadic function called with error text"
 )
DIR,:(enlist`define)!enlist`$"assign, define, control and debug"
TXT,:(enlist`dotz)!enlist(
 ".z.a       ip-address ";
 ".z.ac      http authenticate from cookie ";
 ".z.b       dependencies (more information than \\b)";
 ".z.bm      callback on bad message";
 ".z.c       physical core count";
 ".z.d       utc date";
 ".z.D       local date";
 ".z.e       TLS connection status";
 ".z.exit    callback on exit ";
 ".z.ex      (in debugger) failing primitive";
 ".z.ey      (in debugger) failing primitive's arglist";
 ".z.f       startup file";
 ".z.h       hostname";
 ".z.i       pid";
 ".z.k       kdb+ releasedate ";
 ".z.K       kdb+ major version";
 ".z.l       license information (;expirydate;updatedate;;;)";
 ".z.n       utc timespan ";
 ".z.N       local timespan";
 ".z.o       OS ";
 ".z.p       utc timestamp";
 ".z.P       local timestamp ";
 ".z.pc[h]   close, h handle (already closed)";
 ".z.pg[x]   get";
 ".z.ph[x]   http get";
 ".z.pi[x]   input (qcon)";
 ".z.po[h]   open, h handle ";
 ".z.pp[x]   http post";
 ".z.ps[x]   set";
 ".z.pw[u;p] validate user and password";
 ".z.q       in quiet mode (no console)";
 ".z.s       self, current function definition";
 ".z.t       utc time";
 ".z.T       local time";
 ".z.ts[x]   timer expression (called every \\t)";
 ".z.u       userid ";
 ".z.vs[v;i] value set";
 ".z.w       handle (0 for console, handle to remote for KIPC)";
 ".z.wc[h]   websocket close";
 ".z.wo[h]   websocket open ";
 ".z.ws[x]   callback for websockets ";
 ".z.W       openHandles!vectorOfMessageSizes (oldest first)";
 ".z.x       command line parameters (argc..)";
 ".z.X       raw command line ";
 ".z.z       utc timestamp";
 ".z.zd      default compression for set (blockSize;algo;zipLevel)";
 ".z.Z       local timestamp"
 )
DIR,:(enlist`dotz)!enlist`$".z locale contents "
TXT,:(enlist`envvar)!enlist(
 "var---default---use-------------------------------------------------";
 "QHOME $HOME/q   folder searched for q.k and unqualified script names";
 "QLIC  $QHOME    folder searched for k4.lic license file ";
 "QINIT q.q       additional file loaded after q.k has initialised";
 "";
 "LINES           supplied by OS, used to set \\c";
 "COLUMNS         \\c $LINES $COLUMNS";
 "make sure LINES and COLUMNS are exported. In bash:";
 "export LINES COLUMNS";
 "before starting q";
 "";
 "getenv`VARNAME";
 "`VARNAME setenv \"NEWVALUE\""
 )
DIR,:(enlist`envvar)!enlist`$"envvar - environment variables "
TXT,:(enlist`errors)!enlist(
 "runtime errors";
 "error--------example-----explanation";
 "access                   attempt to read files above directory, run system commands or failed usr/pwd";
 "accp                     tried to accept an incoming tcp/ip connection but failed to do so";
 "adict        d[::]:x     blocked assignment ('nyi) ";
 "arch                     attempt to load file of wrong endian format";
 "assign       cos:12      attempt to reuse a reserved word";
 "badtail                  incomplete transaction at end of logfile, get good (count;length) with -11!(-2;`:file)";
 "cast         `sym$`xxx   attempt to enumerate invalid value (`xxx not in sym in example) ";
 "conn                     too many incoming connections (1022 max)";
 "d8                       the log had a partial transaction at the end but q couldn't truncate the file.";
 "domain       !-1         out of domain";
 "elim                     more than 57 distinct enumerations ";
 "from         select a b  badly formed select statement";
 "glim                     limit on number of vectors with a `g# attribute, unlimited since 3.2 ";
 "hwr                      handle write error, can't write inside a peach";
 "insert                   attempt to insert a record with a key that already exists ";
 "length       ()+!1       incompatible lengths";
 "limit        0W#2        tried to generate a list longer than 2,000,000,000           ";
 "loop         a::a        dependency or transitive closure loop";
 "mismatch                 columns that can't be aligned for R,R or K,K ";
 "mlim                     limit on number of concurrently mapped nested vectors, currently 65530";
 "nyi                      not yet implemented";
 "noamend                  can't change global state inside an amend";
 "noupdate                 update not allowed when using negative port number";
 "nosocket                 can only open/use sockets in main thread ";
 "os                       operating system error";
 "parse                    invalid syntax";
 "part                     something wrong with the partitions in the hdb";
 "pl                       peach can't handle parallel lambda's (2.3 only)";
 "Q7                       nyi op on file nested array";
 "rank         +[2;3;4]    invalid rank or valence";
 "rb                       encountered a problem whilst doing a blocking read";
 "s-fail       `s#2 1      cannot apply `s# to data (not ascending values) ";
 "splay                    nyi op on splayed table";
 "stack        {.z.s[]}[]  ran out of stack space";
 "step                     attempt to upsert into stepped (`s#) dictionary ";
 "stop        \t           user interrupt(ctrl-c) or time limit (-T)";
 "stype        '42         invalid type used to signal";
 "threadview               views can only be calculated from the main thread";
 "trunc                    the log had a partial transaction at the end but q couldn't truncate the file.";
 "type         til 2.2     wrong type";
 "u-fail       `u#1 1      cannot apply `u# to data (not unique values)";
 "unmappable               when saving partitioned data, each column must be mappable";
 "value                    no value";
 "vd1                      attempted multithread update";
 "view                     trying to re-assign a view to something else";
 "wsfull                   malloc failed. ran out of swap (or addressability on 32bit). or hit -w limit.";
 "XXX                      value error (XXX undefined) ";
 "";
 "system (file and ipc) errors";
 "XXX:YYY                  XXX is from kdb+, YYY from the OS";
 "XXX from addr, close, conn, p(from -p), snd, rcv or (invalid) filename (read0`:invalidname.txt)";
 "";
 "parse errors (execute or load)";
 "[/(/{/]/)/}/\"            open ([{ or \"";
 "branch                   a branch(if;do;while;$[.;.;.]) more than 255 byte codes away";
 "char                     invalid character";
 "constants                too many constants (max 96)";
 "globals                  too many global variables (32 max)";
 "locals                   too many local variables (24 max)";
 "params                   too many parameters (8 max)";
 "";
 "license errors";
 "cores                    too many cores";
 "exp                      expiry date passed";
 "host                     unlicensed host";
 "k4.lic                   k4.lic file not found, check QHOME/QLIC";
 "os                       unlicensed OS";
 "srv                      attempt to use client-only license in server mode ";
 "upd                      attempt to use version of kdb+ more recent than update date";
 "user                     unlicensed user";
 "wha                      invalid system date"
 )
DIR,:(enlist`errors)!enlist`$"error messages"
TXT,:(enlist`kill)!enlist(
 "If the q session is responsive and listening on a port, you can try connecting ";
 "to it via ipc and calling \"exit 0\".";
 "";
 "kill -9 pid results in an ungraceful exit, and should be used as a last resort.";
 "If kdb+ is responsive, send it SIGTERM, e.g. kill pid";
 "If it is not responsive, send SIGINT, then SIGTERM.";
 "If that doesn't work, and you really have to, then kill -9 pid.";
 "";
 "the pid of a q process is .z.i "
 )
DIR,:(enlist`kill)!enlist`$"kill - killing a q session"
TXT,:(enlist`lic)!enlist(
 "The locations for the license file k4.lic are:";
 "    the q directory ";
 "    the directory pointed to by the env var QHOME";
 "    the directory pointed to by the env var QLIC";
 "";
 "license errors, see help`errors";
 "";
 "licadmin@kx.com deals with license questions";
 "failover@kx.com can provide a temporary emergency license "
 )
DIR,:(enlist`lic)!enlist`$"licenses - kdb+ license files "
TXT,:(enlist`negbang)!enlist(
 "--n--wrapper-----------------------------------------------------------";
 " 0N!         tee, output and return x";
 " -1! hsym    handle from sym x - ensures prefixed with :";
 " -2! attr    attributes of x";
 " -3! .Q.s1   display x";
 " -4!         tokens in string x";
 " -5! parse   parse tree for string x ";
 " -6! eval    evaluate parse tree x ";
 " -7! hcount  size of file x (handle count)";
 " -8!         byte representation of x";
 " -9!         k value from byte representation x ";
 "-10!         resolve type number x to enum";
 "-11!         streaming execute file x";
 " -11!logfile      streaming execute of entire logfile";
 " -11!(n;logfile)  streaming execute of first n cells in logfile";
 " -11!(-2;logfile) count valid cells in logfile";
 "-12! .Q.host hostname from address x (.z.a)";
 "-13! .Q.attr address from hostname x";
 "-14!         escape \" in string x (for csvs)";
 "-15! md5     md5 for string x";
 "-16!         reference count for x";
 "-17!         read0 kdb+ file x from \"other\" endian ";
 "-18!         compressed version of -8!";
 "-19!         compress file (`:infile;`:outfile;blockSize;algo;zipLevel)";
 "                           (  data  ;`:outfile;blockSize;algo;zipLevel)";
 "-20! .Q.gc   garbage collect";
 "-21!         compression information for file x";
 "-22!         optimised shortcut for count -8!x ";
 "-23!         map data into memory without copying ";
 "-24! parse   like -5!, but in read-only mode ";
 "-25!(handles;msg) async broadcast <msg> to multiple handles";
 "-26!()       TLS settings for current process";
 "-26!handle   TLS settings for handle";
 "-29!x        json support internal"
 )
DIR,:(enlist`negbang)!enlist`$"negative bang - -n!x - system calls"
TXT,:(enlist`save)!enlist(
 "tables can be written as a single file or spread across a directory, e.g.";
 "`:trade set x      / write as single file ";
 "`:trade/ set x     / write across a directory ";
 "trade:get`:trade   / read ";
 "trade:get`:trade/  / map columns on demand";
 "";
 "tables splayed across a directory must be fully enumerated(no varchar) and not keyed."
 )
DIR,:(enlist`save)!enlist`$"save/load tables"
TXT,:(enlist`syscmd)!enlist(
 "\\1 filename  redirect stdout";
 "\\2 filename  redirect stderr";
 "\\a [n]       tables [namespace]";
 "\\b           views (see also .z.b)";
 "\\B           invalid/pending dependencies";
 "\\c [23 79]   console height,width";
 "\\C [36 2000] browser height,width";
 "\\d [n]       q namespace/directory [go to]";
 "\\e [0|1|2]   error trap clients 0=off|1=on|2=display";
 "\\f [n]       functions [namespace]";
 "\\g [0|1]     garbage collection mode ";
 "\\l [f]       load script (or dir:files splays parts scripts)";
 "\\l .         (re)load data only, ignore any scripts  ";
 "\\o [N]       offset from gmt";
 "\\p [i]       port (0 turns off)";
 "\\P [7]       print digits(0-all)";
 "\\r           replication master";
 "\\r old new   unix mv ";
 "\\s           number of slaves (query only) ";
 "\\S [-314159] random seed";
 "\\t [i]       timer [x] milliseconds (1st fire after delay)";
 "\\t expr      time for expression ";
 "\\ts expr     time and space for expression";
 "\\T [i]       timeout [x] seconds ";
 "\\u           reload the user:pswd file specified with -u";
 "\\v [n]       variables [namespace]";
 "\\w           workspace (bytes allocated; available bytes in heap; max heap so far;";
 "                        max bytes available; mapped bytes; physical memory)";
 "             (max bytes set by -w, 0 => unlimited) - see .Q.w[]";
 "\\w 0         count symbols defined, symbol space used (bytes)";
 "\\W [2]       week offset(sat..fri)";
 "\\x .z.p?     expunge .z.zd or .z.p? value (ie reset to default)";
 "\\z [0|1]    \"D\"$ uses mm/dd/yyyy (0) or dd/mm/yyyy (1)";
 "\\cd [d]      O/S directory [go to]";
 "\\_           is readonly (cmdline -b)";
 "\\_ f.q       create runtime script f.q_ from f.q (or f.k_ from f.k) ";
 "\\[other]     O/S execute";
 "\\\\           exit";
 "\\            (escape suspension, or switch language mode)";
 "ctrl-c       (stop)"
 )
DIR,:(enlist`syscmd)!enlist`$"system commands"
TXT,:(enlist`temporal)!enlist(
 "`timestamp$x ~ 2009.11.05D20:39:35.614334000 ~ \"p\"$x ~ x.timestamp";
 "`datetime$x ~ 2009.11.05T20:39:35.614 ~ \"z\"$x ~ x.datetime";
 "`year$x ~ 2009 ~ x.year";
 "`month$x ~ 2009.11m ~ \"m\"$x ~ x.month";
 "`mm$`date$x ~ 11 ~ x.mm";
 "`week$x ~ 2009.11.02 ~ x.week";
 "`date$x ~ 2009.11.05 ~ \"d\"$x ~ x.date";
 "`dd$x ~ 5 ~ x.dd";
 "`hh$x ~ 20 ~ x.hh";
 "`minute$x ~ 20:39 ~ \"u\"$x ~ x.minute";
 "`mm$`time$x ~ 39 ~ x.mm";
 "`uu$x ~ 39 ~ x.uu";
 "`second$x ~ 20:39:35 ~ \"v\"$x ~ x.second";
 "`ss$x ~ 35 ~ x.ss";
 "`time$x ~ 20:39:35.614 ~ \"t\"$x ~ x.time";
 "`timespan$x ~ 0D20:39:35.614334000 ~ \"n\"$x ~ x.timespan"
 )
DIR,:(enlist`temporal)!enlist`$"temporal - date & time casts"
TXT,:(enlist`verbs)!enlist(
 "verb-infix-------prefix";
 "s:x  gets     :x idem";
 "i+i  plus     +l flip";
 "i-i  minus    -i neg";
 "i*i  times    *l first";
 "f%f  divide   %f reciprocal";
 "a&a  and      &B where";
 "a|a  or       |l reverse";
 "a^a  fill     ^a null";
 "a=a  equal    =l group";
 "a<a  less     <l iasc     <s(hopen)";
 "a>a  more     >l idesc    >i(hclose)";
 "c$a  cast s$  $a string   h$a \"C\"$C `$C";
 "l,l  cat      ,x enlist";
 "i#l  take     #l count";
 "i_l  drop     _a floor    sc(lower)";
 "x~x  match    ~a not      ~s(hdelete)";
 "l!l  xkey     !d key      !i (s;();S):!s";
 "A?a  find     ?l distinct rand([n]?bgxhijefcs)";
 "x@i  at   s@  @x type          trap amend(:+-*%&|,)";
 "x.l  dot  s.  .d value    .sCL trap dmend(:+-*%&|,)";
 "A bin a;a in A;a within(a;a);sC like C;sC ss sC";
 "{sqrt log exp sin cos tan asin acos atan}f";
 "last sum prd min max avg wsum wavg xbar";
 "exit getenv";
 "";
 "dependency::expression (when not in function definition)"
 )
DIR,:(enlist`verbs)!enlist`$"verbs/functions"
.q.help:.help.display
