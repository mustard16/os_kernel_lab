
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	b8 08 0d 11 00       	mov    $0x110d08,%eax
  10000b:	2d 16 fa 10 00       	sub    $0x10fa16,%eax
  100010:	89 44 24 08          	mov    %eax,0x8(%esp)
  100014:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001b:	00 
  10001c:	c7 04 24 16 fa 10 00 	movl   $0x10fa16,(%esp)
  100023:	e8 ee 33 00 00       	call   103416 <memset>

    cons_init();                // init the console
  100028:	e8 c4 15 00 00       	call   1015f1 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  10002d:	c7 45 f4 c0 35 10 00 	movl   $0x1035c0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100034:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100037:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003b:	c7 04 24 dc 35 10 00 	movl   $0x1035dc,(%esp)
  100042:	e8 d9 02 00 00       	call   100320 <cprintf>

    print_kerninfo();
  100047:	e8 f7 07 00 00       	call   100843 <print_kerninfo>

    grade_backtrace();
  10004c:	e8 90 00 00 00       	call   1000e1 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100051:	e8 17 2a 00 00       	call   102a6d <pmm_init>

    pic_init();                 // init interrupt controller
  100056:	e8 f1 16 00 00       	call   10174c <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005b:	e8 78 18 00 00       	call   1018d8 <idt_init>

    clock_init();               // init clock interrupt
  100060:	e8 2d 0d 00 00       	call   100d92 <clock_init>
    intr_enable();              // enable irq interrupt
  100065:	e8 40 16 00 00       	call   1016aa <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006a:	eb fe                	jmp    10006a <kern_init+0x6a>

0010006c <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  10006c:	55                   	push   %ebp
  10006d:	89 e5                	mov    %esp,%ebp
  10006f:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  100072:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100079:	00 
  10007a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100081:	00 
  100082:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100089:	e8 1f 0c 00 00       	call   100cad <mon_backtrace>
}
  10008e:	90                   	nop
  10008f:	89 ec                	mov    %ebp,%esp
  100091:	5d                   	pop    %ebp
  100092:	c3                   	ret    

00100093 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100093:	55                   	push   %ebp
  100094:	89 e5                	mov    %esp,%ebp
  100096:	83 ec 18             	sub    $0x18,%esp
  100099:	89 5d fc             	mov    %ebx,-0x4(%ebp)
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  10009c:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  10009f:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000a2:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a8:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000ac:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000b0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000b4:	89 04 24             	mov    %eax,(%esp)
  1000b7:	e8 b0 ff ff ff       	call   10006c <grade_backtrace2>
}
  1000bc:	90                   	nop
  1000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000c0:	89 ec                	mov    %ebp,%esp
  1000c2:	5d                   	pop    %ebp
  1000c3:	c3                   	ret    

001000c4 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c4:	55                   	push   %ebp
  1000c5:	89 e5                	mov    %esp,%ebp
  1000c7:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000ca:	8b 45 10             	mov    0x10(%ebp),%eax
  1000cd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d4:	89 04 24             	mov    %eax,(%esp)
  1000d7:	e8 b7 ff ff ff       	call   100093 <grade_backtrace1>
}
  1000dc:	90                   	nop
  1000dd:	89 ec                	mov    %ebp,%esp
  1000df:	5d                   	pop    %ebp
  1000e0:	c3                   	ret    

001000e1 <grade_backtrace>:

void
grade_backtrace(void) {
  1000e1:	55                   	push   %ebp
  1000e2:	89 e5                	mov    %esp,%ebp
  1000e4:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e7:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000ec:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000f3:	ff 
  1000f4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000ff:	e8 c0 ff ff ff       	call   1000c4 <grade_backtrace0>
}
  100104:	90                   	nop
  100105:	89 ec                	mov    %ebp,%esp
  100107:	5d                   	pop    %ebp
  100108:	c3                   	ret    

00100109 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100109:	55                   	push   %ebp
  10010a:	89 e5                	mov    %esp,%ebp
  10010c:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10010f:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100112:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100115:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100118:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  10011b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011f:	83 e0 03             	and    $0x3,%eax
  100122:	89 c2                	mov    %eax,%edx
  100124:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100129:	89 54 24 08          	mov    %edx,0x8(%esp)
  10012d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100131:	c7 04 24 e1 35 10 00 	movl   $0x1035e1,(%esp)
  100138:	e8 e3 01 00 00       	call   100320 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  10013d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100141:	89 c2                	mov    %eax,%edx
  100143:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100148:	89 54 24 08          	mov    %edx,0x8(%esp)
  10014c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100150:	c7 04 24 ef 35 10 00 	movl   $0x1035ef,(%esp)
  100157:	e8 c4 01 00 00       	call   100320 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  10015c:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100160:	89 c2                	mov    %eax,%edx
  100162:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100167:	89 54 24 08          	mov    %edx,0x8(%esp)
  10016b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10016f:	c7 04 24 fd 35 10 00 	movl   $0x1035fd,(%esp)
  100176:	e8 a5 01 00 00       	call   100320 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10017b:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10017f:	89 c2                	mov    %eax,%edx
  100181:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100186:	89 54 24 08          	mov    %edx,0x8(%esp)
  10018a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10018e:	c7 04 24 0b 36 10 00 	movl   $0x10360b,(%esp)
  100195:	e8 86 01 00 00       	call   100320 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  10019a:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10019e:	89 c2                	mov    %eax,%edx
  1001a0:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001a5:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001ad:	c7 04 24 19 36 10 00 	movl   $0x103619,(%esp)
  1001b4:	e8 67 01 00 00       	call   100320 <cprintf>
    round ++;
  1001b9:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001be:	40                   	inc    %eax
  1001bf:	a3 20 fa 10 00       	mov    %eax,0x10fa20
}
  1001c4:	90                   	nop
  1001c5:	89 ec                	mov    %ebp,%esp
  1001c7:	5d                   	pop    %ebp
  1001c8:	c3                   	ret    

001001c9 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001c9:	55                   	push   %ebp
  1001ca:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001cc:	90                   	nop
  1001cd:	5d                   	pop    %ebp
  1001ce:	c3                   	ret    

001001cf <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001cf:	55                   	push   %ebp
  1001d0:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001d2:	90                   	nop
  1001d3:	5d                   	pop    %ebp
  1001d4:	c3                   	ret    

001001d5 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001d5:	55                   	push   %ebp
  1001d6:	89 e5                	mov    %esp,%ebp
  1001d8:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001db:	e8 29 ff ff ff       	call   100109 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001e0:	c7 04 24 28 36 10 00 	movl   $0x103628,(%esp)
  1001e7:	e8 34 01 00 00       	call   100320 <cprintf>
    lab1_switch_to_user();
  1001ec:	e8 d8 ff ff ff       	call   1001c9 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001f1:	e8 13 ff ff ff       	call   100109 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001f6:	c7 04 24 48 36 10 00 	movl   $0x103648,(%esp)
  1001fd:	e8 1e 01 00 00       	call   100320 <cprintf>
    lab1_switch_to_kernel();
  100202:	e8 c8 ff ff ff       	call   1001cf <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100207:	e8 fd fe ff ff       	call   100109 <lab1_print_cur_status>
}
  10020c:	90                   	nop
  10020d:	89 ec                	mov    %ebp,%esp
  10020f:	5d                   	pop    %ebp
  100210:	c3                   	ret    

00100211 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100211:	55                   	push   %ebp
  100212:	89 e5                	mov    %esp,%ebp
  100214:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100217:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  10021b:	74 13                	je     100230 <readline+0x1f>
        cprintf("%s", prompt);
  10021d:	8b 45 08             	mov    0x8(%ebp),%eax
  100220:	89 44 24 04          	mov    %eax,0x4(%esp)
  100224:	c7 04 24 67 36 10 00 	movl   $0x103667,(%esp)
  10022b:	e8 f0 00 00 00       	call   100320 <cprintf>
    }
    int i = 0, c;
  100230:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100237:	e8 73 01 00 00       	call   1003af <getchar>
  10023c:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10023f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100243:	79 07                	jns    10024c <readline+0x3b>
            return NULL;
  100245:	b8 00 00 00 00       	mov    $0x0,%eax
  10024a:	eb 78                	jmp    1002c4 <readline+0xb3>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  10024c:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100250:	7e 28                	jle    10027a <readline+0x69>
  100252:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100259:	7f 1f                	jg     10027a <readline+0x69>
            cputchar(c);
  10025b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10025e:	89 04 24             	mov    %eax,(%esp)
  100261:	e8 e2 00 00 00       	call   100348 <cputchar>
            buf[i ++] = c;
  100266:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100269:	8d 50 01             	lea    0x1(%eax),%edx
  10026c:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10026f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100272:	88 90 40 fa 10 00    	mov    %dl,0x10fa40(%eax)
  100278:	eb 45                	jmp    1002bf <readline+0xae>
        }
        else if (c == '\b' && i > 0) {
  10027a:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10027e:	75 16                	jne    100296 <readline+0x85>
  100280:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100284:	7e 10                	jle    100296 <readline+0x85>
            cputchar(c);
  100286:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100289:	89 04 24             	mov    %eax,(%esp)
  10028c:	e8 b7 00 00 00       	call   100348 <cputchar>
            i --;
  100291:	ff 4d f4             	decl   -0xc(%ebp)
  100294:	eb 29                	jmp    1002bf <readline+0xae>
        }
        else if (c == '\n' || c == '\r') {
  100296:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  10029a:	74 06                	je     1002a2 <readline+0x91>
  10029c:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1002a0:	75 95                	jne    100237 <readline+0x26>
            cputchar(c);
  1002a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1002a5:	89 04 24             	mov    %eax,(%esp)
  1002a8:	e8 9b 00 00 00       	call   100348 <cputchar>
            buf[i] = '\0';
  1002ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002b0:	05 40 fa 10 00       	add    $0x10fa40,%eax
  1002b5:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002b8:	b8 40 fa 10 00       	mov    $0x10fa40,%eax
  1002bd:	eb 05                	jmp    1002c4 <readline+0xb3>
        c = getchar();
  1002bf:	e9 73 ff ff ff       	jmp    100237 <readline+0x26>
        }
    }
}
  1002c4:	89 ec                	mov    %ebp,%esp
  1002c6:	5d                   	pop    %ebp
  1002c7:	c3                   	ret    

001002c8 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002c8:	55                   	push   %ebp
  1002c9:	89 e5                	mov    %esp,%ebp
  1002cb:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1002d1:	89 04 24             	mov    %eax,(%esp)
  1002d4:	e8 47 13 00 00       	call   101620 <cons_putc>
    (*cnt) ++;
  1002d9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002dc:	8b 00                	mov    (%eax),%eax
  1002de:	8d 50 01             	lea    0x1(%eax),%edx
  1002e1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002e4:	89 10                	mov    %edx,(%eax)
}
  1002e6:	90                   	nop
  1002e7:	89 ec                	mov    %ebp,%esp
  1002e9:	5d                   	pop    %ebp
  1002ea:	c3                   	ret    

001002eb <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002eb:	55                   	push   %ebp
  1002ec:	89 e5                	mov    %esp,%ebp
  1002ee:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002fb:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1002ff:	8b 45 08             	mov    0x8(%ebp),%eax
  100302:	89 44 24 08          	mov    %eax,0x8(%esp)
  100306:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100309:	89 44 24 04          	mov    %eax,0x4(%esp)
  10030d:	c7 04 24 c8 02 10 00 	movl   $0x1002c8,(%esp)
  100314:	e8 28 29 00 00       	call   102c41 <vprintfmt>
    return cnt;
  100319:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10031c:	89 ec                	mov    %ebp,%esp
  10031e:	5d                   	pop    %ebp
  10031f:	c3                   	ret    

00100320 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100320:	55                   	push   %ebp
  100321:	89 e5                	mov    %esp,%ebp
  100323:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100326:	8d 45 0c             	lea    0xc(%ebp),%eax
  100329:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  10032c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10032f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100333:	8b 45 08             	mov    0x8(%ebp),%eax
  100336:	89 04 24             	mov    %eax,(%esp)
  100339:	e8 ad ff ff ff       	call   1002eb <vcprintf>
  10033e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  100341:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100344:	89 ec                	mov    %ebp,%esp
  100346:	5d                   	pop    %ebp
  100347:	c3                   	ret    

00100348 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100348:	55                   	push   %ebp
  100349:	89 e5                	mov    %esp,%ebp
  10034b:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  10034e:	8b 45 08             	mov    0x8(%ebp),%eax
  100351:	89 04 24             	mov    %eax,(%esp)
  100354:	e8 c7 12 00 00       	call   101620 <cons_putc>
}
  100359:	90                   	nop
  10035a:	89 ec                	mov    %ebp,%esp
  10035c:	5d                   	pop    %ebp
  10035d:	c3                   	ret    

0010035e <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10035e:	55                   	push   %ebp
  10035f:	89 e5                	mov    %esp,%ebp
  100361:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100364:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  10036b:	eb 13                	jmp    100380 <cputs+0x22>
        cputch(c, &cnt);
  10036d:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  100371:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100374:	89 54 24 04          	mov    %edx,0x4(%esp)
  100378:	89 04 24             	mov    %eax,(%esp)
  10037b:	e8 48 ff ff ff       	call   1002c8 <cputch>
    while ((c = *str ++) != '\0') {
  100380:	8b 45 08             	mov    0x8(%ebp),%eax
  100383:	8d 50 01             	lea    0x1(%eax),%edx
  100386:	89 55 08             	mov    %edx,0x8(%ebp)
  100389:	0f b6 00             	movzbl (%eax),%eax
  10038c:	88 45 f7             	mov    %al,-0x9(%ebp)
  10038f:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  100393:	75 d8                	jne    10036d <cputs+0xf>
    }
    cputch('\n', &cnt);
  100395:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100398:	89 44 24 04          	mov    %eax,0x4(%esp)
  10039c:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  1003a3:	e8 20 ff ff ff       	call   1002c8 <cputch>
    return cnt;
  1003a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1003ab:	89 ec                	mov    %ebp,%esp
  1003ad:	5d                   	pop    %ebp
  1003ae:	c3                   	ret    

001003af <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1003af:	55                   	push   %ebp
  1003b0:	89 e5                	mov    %esp,%ebp
  1003b2:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1003b5:	90                   	nop
  1003b6:	e8 91 12 00 00       	call   10164c <cons_getc>
  1003bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003be:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003c2:	74 f2                	je     1003b6 <getchar+0x7>
        /* do nothing */;
    return c;
  1003c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003c7:	89 ec                	mov    %ebp,%esp
  1003c9:	5d                   	pop    %ebp
  1003ca:	c3                   	ret    

001003cb <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003cb:	55                   	push   %ebp
  1003cc:	89 e5                	mov    %esp,%ebp
  1003ce:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003d4:	8b 00                	mov    (%eax),%eax
  1003d6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003d9:	8b 45 10             	mov    0x10(%ebp),%eax
  1003dc:	8b 00                	mov    (%eax),%eax
  1003de:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003e1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003e8:	e9 ca 00 00 00       	jmp    1004b7 <stab_binsearch+0xec>
        int true_m = (l + r) / 2, m = true_m;
  1003ed:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003f0:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003f3:	01 d0                	add    %edx,%eax
  1003f5:	89 c2                	mov    %eax,%edx
  1003f7:	c1 ea 1f             	shr    $0x1f,%edx
  1003fa:	01 d0                	add    %edx,%eax
  1003fc:	d1 f8                	sar    %eax
  1003fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100401:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100404:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  100407:	eb 03                	jmp    10040c <stab_binsearch+0x41>
            m --;
  100409:	ff 4d f0             	decl   -0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  10040c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10040f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100412:	7c 1f                	jl     100433 <stab_binsearch+0x68>
  100414:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100417:	89 d0                	mov    %edx,%eax
  100419:	01 c0                	add    %eax,%eax
  10041b:	01 d0                	add    %edx,%eax
  10041d:	c1 e0 02             	shl    $0x2,%eax
  100420:	89 c2                	mov    %eax,%edx
  100422:	8b 45 08             	mov    0x8(%ebp),%eax
  100425:	01 d0                	add    %edx,%eax
  100427:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10042b:	0f b6 c0             	movzbl %al,%eax
  10042e:	39 45 14             	cmp    %eax,0x14(%ebp)
  100431:	75 d6                	jne    100409 <stab_binsearch+0x3e>
        }
        if (m < l) {    // no match in [l, m]
  100433:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100436:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100439:	7d 09                	jge    100444 <stab_binsearch+0x79>
            l = true_m + 1;
  10043b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10043e:	40                   	inc    %eax
  10043f:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100442:	eb 73                	jmp    1004b7 <stab_binsearch+0xec>
        }

        // actual binary search
        any_matches = 1;
  100444:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  10044b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10044e:	89 d0                	mov    %edx,%eax
  100450:	01 c0                	add    %eax,%eax
  100452:	01 d0                	add    %edx,%eax
  100454:	c1 e0 02             	shl    $0x2,%eax
  100457:	89 c2                	mov    %eax,%edx
  100459:	8b 45 08             	mov    0x8(%ebp),%eax
  10045c:	01 d0                	add    %edx,%eax
  10045e:	8b 40 08             	mov    0x8(%eax),%eax
  100461:	39 45 18             	cmp    %eax,0x18(%ebp)
  100464:	76 11                	jbe    100477 <stab_binsearch+0xac>
            *region_left = m;
  100466:	8b 45 0c             	mov    0xc(%ebp),%eax
  100469:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10046c:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  10046e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100471:	40                   	inc    %eax
  100472:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100475:	eb 40                	jmp    1004b7 <stab_binsearch+0xec>
        } else if (stabs[m].n_value > addr) {
  100477:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10047a:	89 d0                	mov    %edx,%eax
  10047c:	01 c0                	add    %eax,%eax
  10047e:	01 d0                	add    %edx,%eax
  100480:	c1 e0 02             	shl    $0x2,%eax
  100483:	89 c2                	mov    %eax,%edx
  100485:	8b 45 08             	mov    0x8(%ebp),%eax
  100488:	01 d0                	add    %edx,%eax
  10048a:	8b 40 08             	mov    0x8(%eax),%eax
  10048d:	39 45 18             	cmp    %eax,0x18(%ebp)
  100490:	73 14                	jae    1004a6 <stab_binsearch+0xdb>
            *region_right = m - 1;
  100492:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100495:	8d 50 ff             	lea    -0x1(%eax),%edx
  100498:	8b 45 10             	mov    0x10(%ebp),%eax
  10049b:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  10049d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004a0:	48                   	dec    %eax
  1004a1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004a4:	eb 11                	jmp    1004b7 <stab_binsearch+0xec>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  1004a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004a9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004ac:	89 10                	mov    %edx,(%eax)
            l = m;
  1004ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004b1:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1004b4:	ff 45 18             	incl   0x18(%ebp)
    while (l <= r) {
  1004b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1004ba:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1004bd:	0f 8e 2a ff ff ff    	jle    1003ed <stab_binsearch+0x22>
        }
    }

    if (!any_matches) {
  1004c3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004c7:	75 0f                	jne    1004d8 <stab_binsearch+0x10d>
        *region_right = *region_left - 1;
  1004c9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004cc:	8b 00                	mov    (%eax),%eax
  1004ce:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004d1:	8b 45 10             	mov    0x10(%ebp),%eax
  1004d4:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  1004d6:	eb 3e                	jmp    100516 <stab_binsearch+0x14b>
        l = *region_right;
  1004d8:	8b 45 10             	mov    0x10(%ebp),%eax
  1004db:	8b 00                	mov    (%eax),%eax
  1004dd:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004e0:	eb 03                	jmp    1004e5 <stab_binsearch+0x11a>
  1004e2:	ff 4d fc             	decl   -0x4(%ebp)
  1004e5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004e8:	8b 00                	mov    (%eax),%eax
  1004ea:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1004ed:	7e 1f                	jle    10050e <stab_binsearch+0x143>
  1004ef:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004f2:	89 d0                	mov    %edx,%eax
  1004f4:	01 c0                	add    %eax,%eax
  1004f6:	01 d0                	add    %edx,%eax
  1004f8:	c1 e0 02             	shl    $0x2,%eax
  1004fb:	89 c2                	mov    %eax,%edx
  1004fd:	8b 45 08             	mov    0x8(%ebp),%eax
  100500:	01 d0                	add    %edx,%eax
  100502:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100506:	0f b6 c0             	movzbl %al,%eax
  100509:	39 45 14             	cmp    %eax,0x14(%ebp)
  10050c:	75 d4                	jne    1004e2 <stab_binsearch+0x117>
        *region_left = l;
  10050e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100511:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100514:	89 10                	mov    %edx,(%eax)
}
  100516:	90                   	nop
  100517:	89 ec                	mov    %ebp,%esp
  100519:	5d                   	pop    %ebp
  10051a:	c3                   	ret    

0010051b <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  10051b:	55                   	push   %ebp
  10051c:	89 e5                	mov    %esp,%ebp
  10051e:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100521:	8b 45 0c             	mov    0xc(%ebp),%eax
  100524:	c7 00 6c 36 10 00    	movl   $0x10366c,(%eax)
    info->eip_line = 0;
  10052a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10052d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100534:	8b 45 0c             	mov    0xc(%ebp),%eax
  100537:	c7 40 08 6c 36 10 00 	movl   $0x10366c,0x8(%eax)
    info->eip_fn_namelen = 9;
  10053e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100541:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100548:	8b 45 0c             	mov    0xc(%ebp),%eax
  10054b:	8b 55 08             	mov    0x8(%ebp),%edx
  10054e:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100551:	8b 45 0c             	mov    0xc(%ebp),%eax
  100554:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  10055b:	c7 45 f4 ec 3e 10 00 	movl   $0x103eec,-0xc(%ebp)
    stab_end = __STAB_END__;
  100562:	c7 45 f0 80 bc 10 00 	movl   $0x10bc80,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100569:	c7 45 ec 81 bc 10 00 	movl   $0x10bc81,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100570:	c7 45 e8 ee e5 10 00 	movl   $0x10e5ee,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100577:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10057a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10057d:	76 0b                	jbe    10058a <debuginfo_eip+0x6f>
  10057f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100582:	48                   	dec    %eax
  100583:	0f b6 00             	movzbl (%eax),%eax
  100586:	84 c0                	test   %al,%al
  100588:	74 0a                	je     100594 <debuginfo_eip+0x79>
        return -1;
  10058a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10058f:	e9 ab 02 00 00       	jmp    10083f <debuginfo_eip+0x324>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100594:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10059b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10059e:	2b 45 f4             	sub    -0xc(%ebp),%eax
  1005a1:	c1 f8 02             	sar    $0x2,%eax
  1005a4:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  1005aa:	48                   	dec    %eax
  1005ab:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1005ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1005b1:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005b5:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1005bc:	00 
  1005bd:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005c0:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005c4:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005c7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005ce:	89 04 24             	mov    %eax,(%esp)
  1005d1:	e8 f5 fd ff ff       	call   1003cb <stab_binsearch>
    if (lfile == 0)
  1005d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005d9:	85 c0                	test   %eax,%eax
  1005db:	75 0a                	jne    1005e7 <debuginfo_eip+0xcc>
        return -1;
  1005dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005e2:	e9 58 02 00 00       	jmp    10083f <debuginfo_eip+0x324>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005e7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005ea:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005ed:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005f0:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1005f6:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005fa:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  100601:	00 
  100602:	8d 45 d8             	lea    -0x28(%ebp),%eax
  100605:	89 44 24 08          	mov    %eax,0x8(%esp)
  100609:	8d 45 dc             	lea    -0x24(%ebp),%eax
  10060c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100610:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100613:	89 04 24             	mov    %eax,(%esp)
  100616:	e8 b0 fd ff ff       	call   1003cb <stab_binsearch>

    if (lfun <= rfun) {
  10061b:	8b 55 dc             	mov    -0x24(%ebp),%edx
  10061e:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100621:	39 c2                	cmp    %eax,%edx
  100623:	7f 78                	jg     10069d <debuginfo_eip+0x182>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  100625:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100628:	89 c2                	mov    %eax,%edx
  10062a:	89 d0                	mov    %edx,%eax
  10062c:	01 c0                	add    %eax,%eax
  10062e:	01 d0                	add    %edx,%eax
  100630:	c1 e0 02             	shl    $0x2,%eax
  100633:	89 c2                	mov    %eax,%edx
  100635:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100638:	01 d0                	add    %edx,%eax
  10063a:	8b 10                	mov    (%eax),%edx
  10063c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10063f:	2b 45 ec             	sub    -0x14(%ebp),%eax
  100642:	39 c2                	cmp    %eax,%edx
  100644:	73 22                	jae    100668 <debuginfo_eip+0x14d>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100646:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100649:	89 c2                	mov    %eax,%edx
  10064b:	89 d0                	mov    %edx,%eax
  10064d:	01 c0                	add    %eax,%eax
  10064f:	01 d0                	add    %edx,%eax
  100651:	c1 e0 02             	shl    $0x2,%eax
  100654:	89 c2                	mov    %eax,%edx
  100656:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100659:	01 d0                	add    %edx,%eax
  10065b:	8b 10                	mov    (%eax),%edx
  10065d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100660:	01 c2                	add    %eax,%edx
  100662:	8b 45 0c             	mov    0xc(%ebp),%eax
  100665:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100668:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10066b:	89 c2                	mov    %eax,%edx
  10066d:	89 d0                	mov    %edx,%eax
  10066f:	01 c0                	add    %eax,%eax
  100671:	01 d0                	add    %edx,%eax
  100673:	c1 e0 02             	shl    $0x2,%eax
  100676:	89 c2                	mov    %eax,%edx
  100678:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10067b:	01 d0                	add    %edx,%eax
  10067d:	8b 50 08             	mov    0x8(%eax),%edx
  100680:	8b 45 0c             	mov    0xc(%ebp),%eax
  100683:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100686:	8b 45 0c             	mov    0xc(%ebp),%eax
  100689:	8b 40 10             	mov    0x10(%eax),%eax
  10068c:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  10068f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100692:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100695:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100698:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10069b:	eb 15                	jmp    1006b2 <debuginfo_eip+0x197>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  10069d:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006a0:	8b 55 08             	mov    0x8(%ebp),%edx
  1006a3:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1006a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1006ac:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006af:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1006b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006b5:	8b 40 08             	mov    0x8(%eax),%eax
  1006b8:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1006bf:	00 
  1006c0:	89 04 24             	mov    %eax,(%esp)
  1006c3:	e8 c6 2b 00 00       	call   10328e <strfind>
  1006c8:	8b 55 0c             	mov    0xc(%ebp),%edx
  1006cb:	8b 4a 08             	mov    0x8(%edx),%ecx
  1006ce:	29 c8                	sub    %ecx,%eax
  1006d0:	89 c2                	mov    %eax,%edx
  1006d2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006d5:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1006db:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006df:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1006e6:	00 
  1006e7:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006ea:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006ee:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006f1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006f8:	89 04 24             	mov    %eax,(%esp)
  1006fb:	e8 cb fc ff ff       	call   1003cb <stab_binsearch>
    if (lline <= rline) {
  100700:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100703:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100706:	39 c2                	cmp    %eax,%edx
  100708:	7f 23                	jg     10072d <debuginfo_eip+0x212>
        info->eip_line = stabs[rline].n_desc;
  10070a:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10070d:	89 c2                	mov    %eax,%edx
  10070f:	89 d0                	mov    %edx,%eax
  100711:	01 c0                	add    %eax,%eax
  100713:	01 d0                	add    %edx,%eax
  100715:	c1 e0 02             	shl    $0x2,%eax
  100718:	89 c2                	mov    %eax,%edx
  10071a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10071d:	01 d0                	add    %edx,%eax
  10071f:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  100723:	89 c2                	mov    %eax,%edx
  100725:	8b 45 0c             	mov    0xc(%ebp),%eax
  100728:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10072b:	eb 11                	jmp    10073e <debuginfo_eip+0x223>
        return -1;
  10072d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100732:	e9 08 01 00 00       	jmp    10083f <debuginfo_eip+0x324>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100737:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10073a:	48                   	dec    %eax
  10073b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  10073e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100741:	8b 45 e4             	mov    -0x1c(%ebp),%eax
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100744:	39 c2                	cmp    %eax,%edx
  100746:	7c 56                	jl     10079e <debuginfo_eip+0x283>
           && stabs[lline].n_type != N_SOL
  100748:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10074b:	89 c2                	mov    %eax,%edx
  10074d:	89 d0                	mov    %edx,%eax
  10074f:	01 c0                	add    %eax,%eax
  100751:	01 d0                	add    %edx,%eax
  100753:	c1 e0 02             	shl    $0x2,%eax
  100756:	89 c2                	mov    %eax,%edx
  100758:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10075b:	01 d0                	add    %edx,%eax
  10075d:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100761:	3c 84                	cmp    $0x84,%al
  100763:	74 39                	je     10079e <debuginfo_eip+0x283>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100765:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100768:	89 c2                	mov    %eax,%edx
  10076a:	89 d0                	mov    %edx,%eax
  10076c:	01 c0                	add    %eax,%eax
  10076e:	01 d0                	add    %edx,%eax
  100770:	c1 e0 02             	shl    $0x2,%eax
  100773:	89 c2                	mov    %eax,%edx
  100775:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100778:	01 d0                	add    %edx,%eax
  10077a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10077e:	3c 64                	cmp    $0x64,%al
  100780:	75 b5                	jne    100737 <debuginfo_eip+0x21c>
  100782:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100785:	89 c2                	mov    %eax,%edx
  100787:	89 d0                	mov    %edx,%eax
  100789:	01 c0                	add    %eax,%eax
  10078b:	01 d0                	add    %edx,%eax
  10078d:	c1 e0 02             	shl    $0x2,%eax
  100790:	89 c2                	mov    %eax,%edx
  100792:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100795:	01 d0                	add    %edx,%eax
  100797:	8b 40 08             	mov    0x8(%eax),%eax
  10079a:	85 c0                	test   %eax,%eax
  10079c:	74 99                	je     100737 <debuginfo_eip+0x21c>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10079e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007a4:	39 c2                	cmp    %eax,%edx
  1007a6:	7c 42                	jl     1007ea <debuginfo_eip+0x2cf>
  1007a8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007ab:	89 c2                	mov    %eax,%edx
  1007ad:	89 d0                	mov    %edx,%eax
  1007af:	01 c0                	add    %eax,%eax
  1007b1:	01 d0                	add    %edx,%eax
  1007b3:	c1 e0 02             	shl    $0x2,%eax
  1007b6:	89 c2                	mov    %eax,%edx
  1007b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007bb:	01 d0                	add    %edx,%eax
  1007bd:	8b 10                	mov    (%eax),%edx
  1007bf:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1007c2:	2b 45 ec             	sub    -0x14(%ebp),%eax
  1007c5:	39 c2                	cmp    %eax,%edx
  1007c7:	73 21                	jae    1007ea <debuginfo_eip+0x2cf>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1007c9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007cc:	89 c2                	mov    %eax,%edx
  1007ce:	89 d0                	mov    %edx,%eax
  1007d0:	01 c0                	add    %eax,%eax
  1007d2:	01 d0                	add    %edx,%eax
  1007d4:	c1 e0 02             	shl    $0x2,%eax
  1007d7:	89 c2                	mov    %eax,%edx
  1007d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007dc:	01 d0                	add    %edx,%eax
  1007de:	8b 10                	mov    (%eax),%edx
  1007e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007e3:	01 c2                	add    %eax,%edx
  1007e5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007e8:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007ea:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007ed:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007f0:	39 c2                	cmp    %eax,%edx
  1007f2:	7d 46                	jge    10083a <debuginfo_eip+0x31f>
        for (lline = lfun + 1;
  1007f4:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007f7:	40                   	inc    %eax
  1007f8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1007fb:	eb 16                	jmp    100813 <debuginfo_eip+0x2f8>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1007fd:	8b 45 0c             	mov    0xc(%ebp),%eax
  100800:	8b 40 14             	mov    0x14(%eax),%eax
  100803:	8d 50 01             	lea    0x1(%eax),%edx
  100806:	8b 45 0c             	mov    0xc(%ebp),%eax
  100809:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  10080c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10080f:	40                   	inc    %eax
  100810:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100813:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100816:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100819:	39 c2                	cmp    %eax,%edx
  10081b:	7d 1d                	jge    10083a <debuginfo_eip+0x31f>
  10081d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100820:	89 c2                	mov    %eax,%edx
  100822:	89 d0                	mov    %edx,%eax
  100824:	01 c0                	add    %eax,%eax
  100826:	01 d0                	add    %edx,%eax
  100828:	c1 e0 02             	shl    $0x2,%eax
  10082b:	89 c2                	mov    %eax,%edx
  10082d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100830:	01 d0                	add    %edx,%eax
  100832:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100836:	3c a0                	cmp    $0xa0,%al
  100838:	74 c3                	je     1007fd <debuginfo_eip+0x2e2>
        }
    }
    return 0;
  10083a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10083f:	89 ec                	mov    %ebp,%esp
  100841:	5d                   	pop    %ebp
  100842:	c3                   	ret    

00100843 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100843:	55                   	push   %ebp
  100844:	89 e5                	mov    %esp,%ebp
  100846:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100849:	c7 04 24 76 36 10 00 	movl   $0x103676,(%esp)
  100850:	e8 cb fa ff ff       	call   100320 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100855:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10085c:	00 
  10085d:	c7 04 24 8f 36 10 00 	movl   $0x10368f,(%esp)
  100864:	e8 b7 fa ff ff       	call   100320 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100869:	c7 44 24 04 a2 35 10 	movl   $0x1035a2,0x4(%esp)
  100870:	00 
  100871:	c7 04 24 a7 36 10 00 	movl   $0x1036a7,(%esp)
  100878:	e8 a3 fa ff ff       	call   100320 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  10087d:	c7 44 24 04 16 fa 10 	movl   $0x10fa16,0x4(%esp)
  100884:	00 
  100885:	c7 04 24 bf 36 10 00 	movl   $0x1036bf,(%esp)
  10088c:	e8 8f fa ff ff       	call   100320 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100891:	c7 44 24 04 08 0d 11 	movl   $0x110d08,0x4(%esp)
  100898:	00 
  100899:	c7 04 24 d7 36 10 00 	movl   $0x1036d7,(%esp)
  1008a0:	e8 7b fa ff ff       	call   100320 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1008a5:	b8 08 0d 11 00       	mov    $0x110d08,%eax
  1008aa:	2d 00 00 10 00       	sub    $0x100000,%eax
  1008af:	05 ff 03 00 00       	add    $0x3ff,%eax
  1008b4:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008ba:	85 c0                	test   %eax,%eax
  1008bc:	0f 48 c2             	cmovs  %edx,%eax
  1008bf:	c1 f8 0a             	sar    $0xa,%eax
  1008c2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008c6:	c7 04 24 f0 36 10 00 	movl   $0x1036f0,(%esp)
  1008cd:	e8 4e fa ff ff       	call   100320 <cprintf>
}
  1008d2:	90                   	nop
  1008d3:	89 ec                	mov    %ebp,%esp
  1008d5:	5d                   	pop    %ebp
  1008d6:	c3                   	ret    

001008d7 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008d7:	55                   	push   %ebp
  1008d8:	89 e5                	mov    %esp,%ebp
  1008da:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008e0:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008e3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008e7:	8b 45 08             	mov    0x8(%ebp),%eax
  1008ea:	89 04 24             	mov    %eax,(%esp)
  1008ed:	e8 29 fc ff ff       	call   10051b <debuginfo_eip>
  1008f2:	85 c0                	test   %eax,%eax
  1008f4:	74 15                	je     10090b <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1008f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1008f9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008fd:	c7 04 24 1a 37 10 00 	movl   $0x10371a,(%esp)
  100904:	e8 17 fa ff ff       	call   100320 <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  100909:	eb 6c                	jmp    100977 <print_debuginfo+0xa0>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  10090b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100912:	eb 1b                	jmp    10092f <print_debuginfo+0x58>
            fnname[j] = info.eip_fn_name[j];
  100914:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100917:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10091a:	01 d0                	add    %edx,%eax
  10091c:	0f b6 10             	movzbl (%eax),%edx
  10091f:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100925:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100928:	01 c8                	add    %ecx,%eax
  10092a:	88 10                	mov    %dl,(%eax)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  10092c:	ff 45 f4             	incl   -0xc(%ebp)
  10092f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100932:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100935:	7c dd                	jl     100914 <print_debuginfo+0x3d>
        fnname[j] = '\0';
  100937:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  10093d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100940:	01 d0                	add    %edx,%eax
  100942:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100945:	8b 55 ec             	mov    -0x14(%ebp),%edx
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100948:	8b 45 08             	mov    0x8(%ebp),%eax
  10094b:	29 d0                	sub    %edx,%eax
  10094d:	89 c1                	mov    %eax,%ecx
  10094f:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100952:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100955:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100959:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  10095f:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100963:	89 54 24 08          	mov    %edx,0x8(%esp)
  100967:	89 44 24 04          	mov    %eax,0x4(%esp)
  10096b:	c7 04 24 36 37 10 00 	movl   $0x103736,(%esp)
  100972:	e8 a9 f9 ff ff       	call   100320 <cprintf>
}
  100977:	90                   	nop
  100978:	89 ec                	mov    %ebp,%esp
  10097a:	5d                   	pop    %ebp
  10097b:	c3                   	ret    

0010097c <read_eip>:

static __noinline uint32_t
read_eip(void) {
  10097c:	55                   	push   %ebp
  10097d:	89 e5                	mov    %esp,%ebp
  10097f:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100982:	8b 45 04             	mov    0x4(%ebp),%eax
  100985:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100988:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10098b:	89 ec                	mov    %ebp,%esp
  10098d:	5d                   	pop    %ebp
  10098e:	c3                   	ret    

0010098f <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  10098f:	55                   	push   %ebp
  100990:	89 e5                	mov    %esp,%ebp
  100992:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100995:	89 e8                	mov    %ebp,%eax
  100997:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    return ebp;
  10099a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
     uint32_t t_ebp=read_ebp();
  10099d:	89 45 f4             	mov    %eax,-0xc(%ebp)
     uint32_t t_eip=read_eip();
  1009a0:	e8 d7 ff ff ff       	call   10097c <read_eip>
  1009a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
     for(int i=0;i<STACKFRAME_DEPTH && t_ebp!=0;i++)
  1009a8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  1009af:	e9 a0 00 00 00       	jmp    100a54 <print_stackframe+0xc5>
     {
        cprintf("ebp:0x%08x",t_ebp);
  1009b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009b7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009bb:	c7 04 24 48 37 10 00 	movl   $0x103748,(%esp)
  1009c2:	e8 59 f9 ff ff       	call   100320 <cprintf>
        cprintf(" eip:0x%08x",t_eip);
  1009c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009ce:	c7 04 24 53 37 10 00 	movl   $0x103753,(%esp)
  1009d5:	e8 46 f9 ff ff       	call   100320 <cprintf>
        cprintf(" args:");
  1009da:	c7 04 24 5f 37 10 00 	movl   $0x10375f,(%esp)
  1009e1:	e8 3a f9 ff ff       	call   100320 <cprintf>
        for(int j=1;j<5;j++)
  1009e6:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  1009ed:	eb 31                	jmp    100a20 <print_stackframe+0x91>
        {
            cprintf("0x%08x",*(uint32_t*)(t_ebp + 4*j + 4));      //[ebp+8\12\16\20]
  1009ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009f2:	c1 e0 02             	shl    $0x2,%eax
  1009f5:	89 c2                	mov    %eax,%edx
  1009f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009fa:	01 d0                	add    %edx,%eax
  1009fc:	83 c0 04             	add    $0x4,%eax
  1009ff:	8b 00                	mov    (%eax),%eax
  100a01:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a05:	c7 04 24 66 37 10 00 	movl   $0x103766,(%esp)
  100a0c:	e8 0f f9 ff ff       	call   100320 <cprintf>
            cprintf(" ");
  100a11:	c7 04 24 6d 37 10 00 	movl   $0x10376d,(%esp)
  100a18:	e8 03 f9 ff ff       	call   100320 <cprintf>
        for(int j=1;j<5;j++)
  100a1d:	ff 45 e8             	incl   -0x18(%ebp)
  100a20:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
  100a24:	7e c9                	jle    1009ef <print_stackframe+0x60>
        }
        cprintf("\n");
  100a26:	c7 04 24 6f 37 10 00 	movl   $0x10376f,(%esp)
  100a2d:	e8 ee f8 ff ff       	call   100320 <cprintf>
        print_debuginfo(t_eip-1);
  100a32:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a35:	48                   	dec    %eax
  100a36:	89 04 24             	mov    %eax,(%esp)
  100a39:	e8 99 fe ff ff       	call   1008d7 <print_debuginfo>

        t_eip=*(uint32_t*)(t_ebp+4);
  100a3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a41:	83 c0 04             	add    $0x4,%eax
  100a44:	8b 00                	mov    (%eax),%eax
  100a46:	89 45 f0             	mov    %eax,-0x10(%ebp)
        t_ebp=*(uint32_t*)(t_ebp);
  100a49:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a4c:	8b 00                	mov    (%eax),%eax
  100a4e:	89 45 f4             	mov    %eax,-0xc(%ebp)
     for(int i=0;i<STACKFRAME_DEPTH && t_ebp!=0;i++)
  100a51:	ff 45 ec             	incl   -0x14(%ebp)
  100a54:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100a58:	7f 0a                	jg     100a64 <print_stackframe+0xd5>
  100a5a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100a5e:	0f 85 50 ff ff ff    	jne    1009b4 <print_stackframe+0x25>
     }
}
  100a64:	90                   	nop
  100a65:	89 ec                	mov    %ebp,%esp
  100a67:	5d                   	pop    %ebp
  100a68:	c3                   	ret    

00100a69 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a69:	55                   	push   %ebp
  100a6a:	89 e5                	mov    %esp,%ebp
  100a6c:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100a6f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a76:	eb 0c                	jmp    100a84 <parse+0x1b>
            *buf ++ = '\0';
  100a78:	8b 45 08             	mov    0x8(%ebp),%eax
  100a7b:	8d 50 01             	lea    0x1(%eax),%edx
  100a7e:	89 55 08             	mov    %edx,0x8(%ebp)
  100a81:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a84:	8b 45 08             	mov    0x8(%ebp),%eax
  100a87:	0f b6 00             	movzbl (%eax),%eax
  100a8a:	84 c0                	test   %al,%al
  100a8c:	74 1d                	je     100aab <parse+0x42>
  100a8e:	8b 45 08             	mov    0x8(%ebp),%eax
  100a91:	0f b6 00             	movzbl (%eax),%eax
  100a94:	0f be c0             	movsbl %al,%eax
  100a97:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a9b:	c7 04 24 f4 37 10 00 	movl   $0x1037f4,(%esp)
  100aa2:	e8 b3 27 00 00       	call   10325a <strchr>
  100aa7:	85 c0                	test   %eax,%eax
  100aa9:	75 cd                	jne    100a78 <parse+0xf>
        }
        if (*buf == '\0') {
  100aab:	8b 45 08             	mov    0x8(%ebp),%eax
  100aae:	0f b6 00             	movzbl (%eax),%eax
  100ab1:	84 c0                	test   %al,%al
  100ab3:	74 65                	je     100b1a <parse+0xb1>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100ab5:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100ab9:	75 14                	jne    100acf <parse+0x66>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100abb:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100ac2:	00 
  100ac3:	c7 04 24 f9 37 10 00 	movl   $0x1037f9,(%esp)
  100aca:	e8 51 f8 ff ff       	call   100320 <cprintf>
        }
        argv[argc ++] = buf;
  100acf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ad2:	8d 50 01             	lea    0x1(%eax),%edx
  100ad5:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100ad8:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100adf:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ae2:	01 c2                	add    %eax,%edx
  100ae4:	8b 45 08             	mov    0x8(%ebp),%eax
  100ae7:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ae9:	eb 03                	jmp    100aee <parse+0x85>
            buf ++;
  100aeb:	ff 45 08             	incl   0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100aee:	8b 45 08             	mov    0x8(%ebp),%eax
  100af1:	0f b6 00             	movzbl (%eax),%eax
  100af4:	84 c0                	test   %al,%al
  100af6:	74 8c                	je     100a84 <parse+0x1b>
  100af8:	8b 45 08             	mov    0x8(%ebp),%eax
  100afb:	0f b6 00             	movzbl (%eax),%eax
  100afe:	0f be c0             	movsbl %al,%eax
  100b01:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b05:	c7 04 24 f4 37 10 00 	movl   $0x1037f4,(%esp)
  100b0c:	e8 49 27 00 00       	call   10325a <strchr>
  100b11:	85 c0                	test   %eax,%eax
  100b13:	74 d6                	je     100aeb <parse+0x82>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b15:	e9 6a ff ff ff       	jmp    100a84 <parse+0x1b>
            break;
  100b1a:	90                   	nop
        }
    }
    return argc;
  100b1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100b1e:	89 ec                	mov    %ebp,%esp
  100b20:	5d                   	pop    %ebp
  100b21:	c3                   	ret    

00100b22 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100b22:	55                   	push   %ebp
  100b23:	89 e5                	mov    %esp,%ebp
  100b25:	83 ec 68             	sub    $0x68,%esp
  100b28:	89 5d fc             	mov    %ebx,-0x4(%ebp)
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100b2b:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b2e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b32:	8b 45 08             	mov    0x8(%ebp),%eax
  100b35:	89 04 24             	mov    %eax,(%esp)
  100b38:	e8 2c ff ff ff       	call   100a69 <parse>
  100b3d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100b40:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100b44:	75 0a                	jne    100b50 <runcmd+0x2e>
        return 0;
  100b46:	b8 00 00 00 00       	mov    $0x0,%eax
  100b4b:	e9 83 00 00 00       	jmp    100bd3 <runcmd+0xb1>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b50:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b57:	eb 5a                	jmp    100bb3 <runcmd+0x91>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100b59:	8b 55 b0             	mov    -0x50(%ebp),%edx
  100b5c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  100b5f:	89 c8                	mov    %ecx,%eax
  100b61:	01 c0                	add    %eax,%eax
  100b63:	01 c8                	add    %ecx,%eax
  100b65:	c1 e0 02             	shl    $0x2,%eax
  100b68:	05 00 f0 10 00       	add    $0x10f000,%eax
  100b6d:	8b 00                	mov    (%eax),%eax
  100b6f:	89 54 24 04          	mov    %edx,0x4(%esp)
  100b73:	89 04 24             	mov    %eax,(%esp)
  100b76:	e8 43 26 00 00       	call   1031be <strcmp>
  100b7b:	85 c0                	test   %eax,%eax
  100b7d:	75 31                	jne    100bb0 <runcmd+0x8e>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b7f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b82:	89 d0                	mov    %edx,%eax
  100b84:	01 c0                	add    %eax,%eax
  100b86:	01 d0                	add    %edx,%eax
  100b88:	c1 e0 02             	shl    $0x2,%eax
  100b8b:	05 08 f0 10 00       	add    $0x10f008,%eax
  100b90:	8b 10                	mov    (%eax),%edx
  100b92:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b95:	83 c0 04             	add    $0x4,%eax
  100b98:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100b9b:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100b9e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100ba1:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100ba5:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ba9:	89 1c 24             	mov    %ebx,(%esp)
  100bac:	ff d2                	call   *%edx
  100bae:	eb 23                	jmp    100bd3 <runcmd+0xb1>
    for (i = 0; i < NCOMMANDS; i ++) {
  100bb0:	ff 45 f4             	incl   -0xc(%ebp)
  100bb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bb6:	83 f8 02             	cmp    $0x2,%eax
  100bb9:	76 9e                	jbe    100b59 <runcmd+0x37>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100bbb:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100bbe:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bc2:	c7 04 24 17 38 10 00 	movl   $0x103817,(%esp)
  100bc9:	e8 52 f7 ff ff       	call   100320 <cprintf>
    return 0;
  100bce:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100bd3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100bd6:	89 ec                	mov    %ebp,%esp
  100bd8:	5d                   	pop    %ebp
  100bd9:	c3                   	ret    

00100bda <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100bda:	55                   	push   %ebp
  100bdb:	89 e5                	mov    %esp,%ebp
  100bdd:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100be0:	c7 04 24 30 38 10 00 	movl   $0x103830,(%esp)
  100be7:	e8 34 f7 ff ff       	call   100320 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100bec:	c7 04 24 58 38 10 00 	movl   $0x103858,(%esp)
  100bf3:	e8 28 f7 ff ff       	call   100320 <cprintf>

    if (tf != NULL) {
  100bf8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100bfc:	74 0b                	je     100c09 <kmonitor+0x2f>
        print_trapframe(tf);
  100bfe:	8b 45 08             	mov    0x8(%ebp),%eax
  100c01:	89 04 24             	mov    %eax,(%esp)
  100c04:	e8 e2 0e 00 00       	call   101aeb <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100c09:	c7 04 24 7d 38 10 00 	movl   $0x10387d,(%esp)
  100c10:	e8 fc f5 ff ff       	call   100211 <readline>
  100c15:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c18:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100c1c:	74 eb                	je     100c09 <kmonitor+0x2f>
            if (runcmd(buf, tf) < 0) {
  100c1e:	8b 45 08             	mov    0x8(%ebp),%eax
  100c21:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c25:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c28:	89 04 24             	mov    %eax,(%esp)
  100c2b:	e8 f2 fe ff ff       	call   100b22 <runcmd>
  100c30:	85 c0                	test   %eax,%eax
  100c32:	78 02                	js     100c36 <kmonitor+0x5c>
        if ((buf = readline("K> ")) != NULL) {
  100c34:	eb d3                	jmp    100c09 <kmonitor+0x2f>
                break;
  100c36:	90                   	nop
            }
        }
    }
}
  100c37:	90                   	nop
  100c38:	89 ec                	mov    %ebp,%esp
  100c3a:	5d                   	pop    %ebp
  100c3b:	c3                   	ret    

00100c3c <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100c3c:	55                   	push   %ebp
  100c3d:	89 e5                	mov    %esp,%ebp
  100c3f:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c42:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c49:	eb 3d                	jmp    100c88 <mon_help+0x4c>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100c4b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c4e:	89 d0                	mov    %edx,%eax
  100c50:	01 c0                	add    %eax,%eax
  100c52:	01 d0                	add    %edx,%eax
  100c54:	c1 e0 02             	shl    $0x2,%eax
  100c57:	05 04 f0 10 00       	add    $0x10f004,%eax
  100c5c:	8b 10                	mov    (%eax),%edx
  100c5e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  100c61:	89 c8                	mov    %ecx,%eax
  100c63:	01 c0                	add    %eax,%eax
  100c65:	01 c8                	add    %ecx,%eax
  100c67:	c1 e0 02             	shl    $0x2,%eax
  100c6a:	05 00 f0 10 00       	add    $0x10f000,%eax
  100c6f:	8b 00                	mov    (%eax),%eax
  100c71:	89 54 24 08          	mov    %edx,0x8(%esp)
  100c75:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c79:	c7 04 24 81 38 10 00 	movl   $0x103881,(%esp)
  100c80:	e8 9b f6 ff ff       	call   100320 <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100c85:	ff 45 f4             	incl   -0xc(%ebp)
  100c88:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c8b:	83 f8 02             	cmp    $0x2,%eax
  100c8e:	76 bb                	jbe    100c4b <mon_help+0xf>
    }
    return 0;
  100c90:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c95:	89 ec                	mov    %ebp,%esp
  100c97:	5d                   	pop    %ebp
  100c98:	c3                   	ret    

00100c99 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c99:	55                   	push   %ebp
  100c9a:	89 e5                	mov    %esp,%ebp
  100c9c:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c9f:	e8 9f fb ff ff       	call   100843 <print_kerninfo>
    return 0;
  100ca4:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100ca9:	89 ec                	mov    %ebp,%esp
  100cab:	5d                   	pop    %ebp
  100cac:	c3                   	ret    

00100cad <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100cad:	55                   	push   %ebp
  100cae:	89 e5                	mov    %esp,%ebp
  100cb0:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100cb3:	e8 d7 fc ff ff       	call   10098f <print_stackframe>
    return 0;
  100cb8:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100cbd:	89 ec                	mov    %ebp,%esp
  100cbf:	5d                   	pop    %ebp
  100cc0:	c3                   	ret    

00100cc1 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100cc1:	55                   	push   %ebp
  100cc2:	89 e5                	mov    %esp,%ebp
  100cc4:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100cc7:	a1 40 fe 10 00       	mov    0x10fe40,%eax
  100ccc:	85 c0                	test   %eax,%eax
  100cce:	75 5b                	jne    100d2b <__panic+0x6a>
        goto panic_dead;
    }
    is_panic = 1;
  100cd0:	c7 05 40 fe 10 00 01 	movl   $0x1,0x10fe40
  100cd7:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100cda:	8d 45 14             	lea    0x14(%ebp),%eax
  100cdd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100ce0:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ce3:	89 44 24 08          	mov    %eax,0x8(%esp)
  100ce7:	8b 45 08             	mov    0x8(%ebp),%eax
  100cea:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cee:	c7 04 24 8a 38 10 00 	movl   $0x10388a,(%esp)
  100cf5:	e8 26 f6 ff ff       	call   100320 <cprintf>
    vcprintf(fmt, ap);
  100cfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cfd:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d01:	8b 45 10             	mov    0x10(%ebp),%eax
  100d04:	89 04 24             	mov    %eax,(%esp)
  100d07:	e8 df f5 ff ff       	call   1002eb <vcprintf>
    cprintf("\n");
  100d0c:	c7 04 24 a6 38 10 00 	movl   $0x1038a6,(%esp)
  100d13:	e8 08 f6 ff ff       	call   100320 <cprintf>
    
    cprintf("stack trackback:\n");
  100d18:	c7 04 24 a8 38 10 00 	movl   $0x1038a8,(%esp)
  100d1f:	e8 fc f5 ff ff       	call   100320 <cprintf>
    print_stackframe();
  100d24:	e8 66 fc ff ff       	call   10098f <print_stackframe>
  100d29:	eb 01                	jmp    100d2c <__panic+0x6b>
        goto panic_dead;
  100d2b:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  100d2c:	e8 81 09 00 00       	call   1016b2 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100d31:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100d38:	e8 9d fe ff ff       	call   100bda <kmonitor>
  100d3d:	eb f2                	jmp    100d31 <__panic+0x70>

00100d3f <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100d3f:	55                   	push   %ebp
  100d40:	89 e5                	mov    %esp,%ebp
  100d42:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100d45:	8d 45 14             	lea    0x14(%ebp),%eax
  100d48:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100d4b:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d4e:	89 44 24 08          	mov    %eax,0x8(%esp)
  100d52:	8b 45 08             	mov    0x8(%ebp),%eax
  100d55:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d59:	c7 04 24 ba 38 10 00 	movl   $0x1038ba,(%esp)
  100d60:	e8 bb f5 ff ff       	call   100320 <cprintf>
    vcprintf(fmt, ap);
  100d65:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d68:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d6c:	8b 45 10             	mov    0x10(%ebp),%eax
  100d6f:	89 04 24             	mov    %eax,(%esp)
  100d72:	e8 74 f5 ff ff       	call   1002eb <vcprintf>
    cprintf("\n");
  100d77:	c7 04 24 a6 38 10 00 	movl   $0x1038a6,(%esp)
  100d7e:	e8 9d f5 ff ff       	call   100320 <cprintf>
    va_end(ap);
}
  100d83:	90                   	nop
  100d84:	89 ec                	mov    %ebp,%esp
  100d86:	5d                   	pop    %ebp
  100d87:	c3                   	ret    

00100d88 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100d88:	55                   	push   %ebp
  100d89:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100d8b:	a1 40 fe 10 00       	mov    0x10fe40,%eax
}
  100d90:	5d                   	pop    %ebp
  100d91:	c3                   	ret    

00100d92 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d92:	55                   	push   %ebp
  100d93:	89 e5                	mov    %esp,%ebp
  100d95:	83 ec 28             	sub    $0x28,%esp
  100d98:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100d9e:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100da2:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100da6:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100daa:	ee                   	out    %al,(%dx)
}
  100dab:	90                   	nop
  100dac:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100db2:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100db6:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100dba:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100dbe:	ee                   	out    %al,(%dx)
}
  100dbf:	90                   	nop
  100dc0:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100dc6:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100dca:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100dce:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100dd2:	ee                   	out    %al,(%dx)
}
  100dd3:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100dd4:	c7 05 44 fe 10 00 00 	movl   $0x0,0x10fe44
  100ddb:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100dde:	c7 04 24 d8 38 10 00 	movl   $0x1038d8,(%esp)
  100de5:	e8 36 f5 ff ff       	call   100320 <cprintf>
    pic_enable(IRQ_TIMER);
  100dea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100df1:	e8 21 09 00 00       	call   101717 <pic_enable>
}
  100df6:	90                   	nop
  100df7:	89 ec                	mov    %ebp,%esp
  100df9:	5d                   	pop    %ebp
  100dfa:	c3                   	ret    

00100dfb <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100dfb:	55                   	push   %ebp
  100dfc:	89 e5                	mov    %esp,%ebp
  100dfe:	83 ec 10             	sub    $0x10,%esp
  100e01:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e07:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e0b:	89 c2                	mov    %eax,%edx
  100e0d:	ec                   	in     (%dx),%al
  100e0e:	88 45 f1             	mov    %al,-0xf(%ebp)
  100e11:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100e17:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100e1b:	89 c2                	mov    %eax,%edx
  100e1d:	ec                   	in     (%dx),%al
  100e1e:	88 45 f5             	mov    %al,-0xb(%ebp)
  100e21:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100e27:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100e2b:	89 c2                	mov    %eax,%edx
  100e2d:	ec                   	in     (%dx),%al
  100e2e:	88 45 f9             	mov    %al,-0x7(%ebp)
  100e31:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100e37:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100e3b:	89 c2                	mov    %eax,%edx
  100e3d:	ec                   	in     (%dx),%al
  100e3e:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e41:	90                   	nop
  100e42:	89 ec                	mov    %ebp,%esp
  100e44:	5d                   	pop    %ebp
  100e45:	c3                   	ret    

00100e46 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e46:	55                   	push   %ebp
  100e47:	89 e5                	mov    %esp,%ebp
  100e49:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e4c:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e53:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e56:	0f b7 00             	movzwl (%eax),%eax
  100e59:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e5d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e60:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e65:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e68:	0f b7 00             	movzwl (%eax),%eax
  100e6b:	0f b7 c0             	movzwl %ax,%eax
  100e6e:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100e73:	74 12                	je     100e87 <cga_init+0x41>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e75:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e7c:	66 c7 05 66 fe 10 00 	movw   $0x3b4,0x10fe66
  100e83:	b4 03 
  100e85:	eb 13                	jmp    100e9a <cga_init+0x54>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e87:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e8a:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e8e:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e91:	66 c7 05 66 fe 10 00 	movw   $0x3d4,0x10fe66
  100e98:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e9a:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ea1:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100ea5:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ea9:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100ead:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100eb1:	ee                   	out    %al,(%dx)
}
  100eb2:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100eb3:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100eba:	40                   	inc    %eax
  100ebb:	0f b7 c0             	movzwl %ax,%eax
  100ebe:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ec2:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100ec6:	89 c2                	mov    %eax,%edx
  100ec8:	ec                   	in     (%dx),%al
  100ec9:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100ecc:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100ed0:	0f b6 c0             	movzbl %al,%eax
  100ed3:	c1 e0 08             	shl    $0x8,%eax
  100ed6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100ed9:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ee0:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100ee4:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ee8:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100eec:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100ef0:	ee                   	out    %al,(%dx)
}
  100ef1:	90                   	nop
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100ef2:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ef9:	40                   	inc    %eax
  100efa:	0f b7 c0             	movzwl %ax,%eax
  100efd:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f01:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100f05:	89 c2                	mov    %eax,%edx
  100f07:	ec                   	in     (%dx),%al
  100f08:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100f0b:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f0f:	0f b6 c0             	movzbl %al,%eax
  100f12:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100f15:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f18:	a3 60 fe 10 00       	mov    %eax,0x10fe60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100f1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f20:	0f b7 c0             	movzwl %ax,%eax
  100f23:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
}
  100f29:	90                   	nop
  100f2a:	89 ec                	mov    %ebp,%esp
  100f2c:	5d                   	pop    %ebp
  100f2d:	c3                   	ret    

00100f2e <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100f2e:	55                   	push   %ebp
  100f2f:	89 e5                	mov    %esp,%ebp
  100f31:	83 ec 48             	sub    $0x48,%esp
  100f34:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100f3a:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f3e:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100f42:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100f46:	ee                   	out    %al,(%dx)
}
  100f47:	90                   	nop
  100f48:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100f4e:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f52:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100f56:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100f5a:	ee                   	out    %al,(%dx)
}
  100f5b:	90                   	nop
  100f5c:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100f62:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f66:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100f6a:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100f6e:	ee                   	out    %al,(%dx)
}
  100f6f:	90                   	nop
  100f70:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f76:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f7a:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f7e:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f82:	ee                   	out    %al,(%dx)
}
  100f83:	90                   	nop
  100f84:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100f8a:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f8e:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f92:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f96:	ee                   	out    %al,(%dx)
}
  100f97:	90                   	nop
  100f98:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100f9e:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fa2:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100fa6:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100faa:	ee                   	out    %al,(%dx)
}
  100fab:	90                   	nop
  100fac:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100fb2:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fb6:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100fba:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100fbe:	ee                   	out    %al,(%dx)
}
  100fbf:	90                   	nop
  100fc0:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fc6:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100fca:	89 c2                	mov    %eax,%edx
  100fcc:	ec                   	in     (%dx),%al
  100fcd:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100fd0:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100fd4:	3c ff                	cmp    $0xff,%al
  100fd6:	0f 95 c0             	setne  %al
  100fd9:	0f b6 c0             	movzbl %al,%eax
  100fdc:	a3 68 fe 10 00       	mov    %eax,0x10fe68
  100fe1:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fe7:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100feb:	89 c2                	mov    %eax,%edx
  100fed:	ec                   	in     (%dx),%al
  100fee:	88 45 f1             	mov    %al,-0xf(%ebp)
  100ff1:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  100ff7:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100ffb:	89 c2                	mov    %eax,%edx
  100ffd:	ec                   	in     (%dx),%al
  100ffe:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  101001:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101006:	85 c0                	test   %eax,%eax
  101008:	74 0c                	je     101016 <serial_init+0xe8>
        pic_enable(IRQ_COM1);
  10100a:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  101011:	e8 01 07 00 00       	call   101717 <pic_enable>
    }
}
  101016:	90                   	nop
  101017:	89 ec                	mov    %ebp,%esp
  101019:	5d                   	pop    %ebp
  10101a:	c3                   	ret    

0010101b <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  10101b:	55                   	push   %ebp
  10101c:	89 e5                	mov    %esp,%ebp
  10101e:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101021:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101028:	eb 08                	jmp    101032 <lpt_putc_sub+0x17>
        delay();
  10102a:	e8 cc fd ff ff       	call   100dfb <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  10102f:	ff 45 fc             	incl   -0x4(%ebp)
  101032:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  101038:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10103c:	89 c2                	mov    %eax,%edx
  10103e:	ec                   	in     (%dx),%al
  10103f:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101042:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101046:	84 c0                	test   %al,%al
  101048:	78 09                	js     101053 <lpt_putc_sub+0x38>
  10104a:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101051:	7e d7                	jle    10102a <lpt_putc_sub+0xf>
    }
    outb(LPTPORT + 0, c);
  101053:	8b 45 08             	mov    0x8(%ebp),%eax
  101056:	0f b6 c0             	movzbl %al,%eax
  101059:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  10105f:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101062:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101066:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10106a:	ee                   	out    %al,(%dx)
}
  10106b:	90                   	nop
  10106c:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  101072:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101076:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10107a:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10107e:	ee                   	out    %al,(%dx)
}
  10107f:	90                   	nop
  101080:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  101086:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10108a:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10108e:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101092:	ee                   	out    %al,(%dx)
}
  101093:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101094:	90                   	nop
  101095:	89 ec                	mov    %ebp,%esp
  101097:	5d                   	pop    %ebp
  101098:	c3                   	ret    

00101099 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101099:	55                   	push   %ebp
  10109a:	89 e5                	mov    %esp,%ebp
  10109c:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  10109f:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1010a3:	74 0d                	je     1010b2 <lpt_putc+0x19>
        lpt_putc_sub(c);
  1010a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1010a8:	89 04 24             	mov    %eax,(%esp)
  1010ab:	e8 6b ff ff ff       	call   10101b <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  1010b0:	eb 24                	jmp    1010d6 <lpt_putc+0x3d>
        lpt_putc_sub('\b');
  1010b2:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1010b9:	e8 5d ff ff ff       	call   10101b <lpt_putc_sub>
        lpt_putc_sub(' ');
  1010be:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1010c5:	e8 51 ff ff ff       	call   10101b <lpt_putc_sub>
        lpt_putc_sub('\b');
  1010ca:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1010d1:	e8 45 ff ff ff       	call   10101b <lpt_putc_sub>
}
  1010d6:	90                   	nop
  1010d7:	89 ec                	mov    %ebp,%esp
  1010d9:	5d                   	pop    %ebp
  1010da:	c3                   	ret    

001010db <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  1010db:	55                   	push   %ebp
  1010dc:	89 e5                	mov    %esp,%ebp
  1010de:	83 ec 38             	sub    $0x38,%esp
  1010e1:	89 5d fc             	mov    %ebx,-0x4(%ebp)
    // set black on white
    if (!(c & ~0xFF)) {
  1010e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1010e7:	25 00 ff ff ff       	and    $0xffffff00,%eax
  1010ec:	85 c0                	test   %eax,%eax
  1010ee:	75 07                	jne    1010f7 <cga_putc+0x1c>
        c |= 0x0700;
  1010f0:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1010f7:	8b 45 08             	mov    0x8(%ebp),%eax
  1010fa:	0f b6 c0             	movzbl %al,%eax
  1010fd:	83 f8 0d             	cmp    $0xd,%eax
  101100:	74 72                	je     101174 <cga_putc+0x99>
  101102:	83 f8 0d             	cmp    $0xd,%eax
  101105:	0f 8f a3 00 00 00    	jg     1011ae <cga_putc+0xd3>
  10110b:	83 f8 08             	cmp    $0x8,%eax
  10110e:	74 0a                	je     10111a <cga_putc+0x3f>
  101110:	83 f8 0a             	cmp    $0xa,%eax
  101113:	74 4c                	je     101161 <cga_putc+0x86>
  101115:	e9 94 00 00 00       	jmp    1011ae <cga_putc+0xd3>
    case '\b':
        if (crt_pos > 0) {
  10111a:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101121:	85 c0                	test   %eax,%eax
  101123:	0f 84 af 00 00 00    	je     1011d8 <cga_putc+0xfd>
            crt_pos --;
  101129:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101130:	48                   	dec    %eax
  101131:	0f b7 c0             	movzwl %ax,%eax
  101134:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  10113a:	8b 45 08             	mov    0x8(%ebp),%eax
  10113d:	98                   	cwtl   
  10113e:	25 00 ff ff ff       	and    $0xffffff00,%eax
  101143:	98                   	cwtl   
  101144:	83 c8 20             	or     $0x20,%eax
  101147:	98                   	cwtl   
  101148:	8b 0d 60 fe 10 00    	mov    0x10fe60,%ecx
  10114e:	0f b7 15 64 fe 10 00 	movzwl 0x10fe64,%edx
  101155:	01 d2                	add    %edx,%edx
  101157:	01 ca                	add    %ecx,%edx
  101159:	0f b7 c0             	movzwl %ax,%eax
  10115c:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  10115f:	eb 77                	jmp    1011d8 <cga_putc+0xfd>
    case '\n':
        crt_pos += CRT_COLS;
  101161:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101168:	83 c0 50             	add    $0x50,%eax
  10116b:	0f b7 c0             	movzwl %ax,%eax
  10116e:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101174:	0f b7 1d 64 fe 10 00 	movzwl 0x10fe64,%ebx
  10117b:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  101182:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  101187:	89 c8                	mov    %ecx,%eax
  101189:	f7 e2                	mul    %edx
  10118b:	c1 ea 06             	shr    $0x6,%edx
  10118e:	89 d0                	mov    %edx,%eax
  101190:	c1 e0 02             	shl    $0x2,%eax
  101193:	01 d0                	add    %edx,%eax
  101195:	c1 e0 04             	shl    $0x4,%eax
  101198:	29 c1                	sub    %eax,%ecx
  10119a:	89 ca                	mov    %ecx,%edx
  10119c:	0f b7 d2             	movzwl %dx,%edx
  10119f:	89 d8                	mov    %ebx,%eax
  1011a1:	29 d0                	sub    %edx,%eax
  1011a3:	0f b7 c0             	movzwl %ax,%eax
  1011a6:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
        break;
  1011ac:	eb 2b                	jmp    1011d9 <cga_putc+0xfe>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  1011ae:	8b 0d 60 fe 10 00    	mov    0x10fe60,%ecx
  1011b4:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1011bb:	8d 50 01             	lea    0x1(%eax),%edx
  1011be:	0f b7 d2             	movzwl %dx,%edx
  1011c1:	66 89 15 64 fe 10 00 	mov    %dx,0x10fe64
  1011c8:	01 c0                	add    %eax,%eax
  1011ca:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  1011cd:	8b 45 08             	mov    0x8(%ebp),%eax
  1011d0:	0f b7 c0             	movzwl %ax,%eax
  1011d3:	66 89 02             	mov    %ax,(%edx)
        break;
  1011d6:	eb 01                	jmp    1011d9 <cga_putc+0xfe>
        break;
  1011d8:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  1011d9:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1011e0:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  1011e5:	76 5e                	jbe    101245 <cga_putc+0x16a>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  1011e7:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  1011ec:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  1011f2:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  1011f7:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  1011fe:	00 
  1011ff:	89 54 24 04          	mov    %edx,0x4(%esp)
  101203:	89 04 24             	mov    %eax,(%esp)
  101206:	e8 4d 22 00 00       	call   103458 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10120b:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  101212:	eb 15                	jmp    101229 <cga_putc+0x14e>
            crt_buf[i] = 0x0700 | ' ';
  101214:	8b 15 60 fe 10 00    	mov    0x10fe60,%edx
  10121a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10121d:	01 c0                	add    %eax,%eax
  10121f:	01 d0                	add    %edx,%eax
  101221:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101226:	ff 45 f4             	incl   -0xc(%ebp)
  101229:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101230:	7e e2                	jle    101214 <cga_putc+0x139>
        }
        crt_pos -= CRT_COLS;
  101232:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101239:	83 e8 50             	sub    $0x50,%eax
  10123c:	0f b7 c0             	movzwl %ax,%eax
  10123f:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  101245:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  10124c:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  101250:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101254:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101258:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10125c:	ee                   	out    %al,(%dx)
}
  10125d:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  10125e:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101265:	c1 e8 08             	shr    $0x8,%eax
  101268:	0f b7 c0             	movzwl %ax,%eax
  10126b:	0f b6 c0             	movzbl %al,%eax
  10126e:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  101275:	42                   	inc    %edx
  101276:	0f b7 d2             	movzwl %dx,%edx
  101279:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  10127d:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101280:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101284:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101288:	ee                   	out    %al,(%dx)
}
  101289:	90                   	nop
    outb(addr_6845, 15);
  10128a:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  101291:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  101295:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101299:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10129d:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1012a1:	ee                   	out    %al,(%dx)
}
  1012a2:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  1012a3:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1012aa:	0f b6 c0             	movzbl %al,%eax
  1012ad:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  1012b4:	42                   	inc    %edx
  1012b5:	0f b7 d2             	movzwl %dx,%edx
  1012b8:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  1012bc:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012bf:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1012c3:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1012c7:	ee                   	out    %al,(%dx)
}
  1012c8:	90                   	nop
}
  1012c9:	90                   	nop
  1012ca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012cd:	89 ec                	mov    %ebp,%esp
  1012cf:	5d                   	pop    %ebp
  1012d0:	c3                   	ret    

001012d1 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  1012d1:	55                   	push   %ebp
  1012d2:	89 e5                	mov    %esp,%ebp
  1012d4:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1012d7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1012de:	eb 08                	jmp    1012e8 <serial_putc_sub+0x17>
        delay();
  1012e0:	e8 16 fb ff ff       	call   100dfb <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1012e5:	ff 45 fc             	incl   -0x4(%ebp)
  1012e8:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1012ee:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1012f2:	89 c2                	mov    %eax,%edx
  1012f4:	ec                   	in     (%dx),%al
  1012f5:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1012f8:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1012fc:	0f b6 c0             	movzbl %al,%eax
  1012ff:	83 e0 20             	and    $0x20,%eax
  101302:	85 c0                	test   %eax,%eax
  101304:	75 09                	jne    10130f <serial_putc_sub+0x3e>
  101306:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10130d:	7e d1                	jle    1012e0 <serial_putc_sub+0xf>
    }
    outb(COM1 + COM_TX, c);
  10130f:	8b 45 08             	mov    0x8(%ebp),%eax
  101312:	0f b6 c0             	movzbl %al,%eax
  101315:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  10131b:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10131e:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101322:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101326:	ee                   	out    %al,(%dx)
}
  101327:	90                   	nop
}
  101328:	90                   	nop
  101329:	89 ec                	mov    %ebp,%esp
  10132b:	5d                   	pop    %ebp
  10132c:	c3                   	ret    

0010132d <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  10132d:	55                   	push   %ebp
  10132e:	89 e5                	mov    %esp,%ebp
  101330:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101333:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101337:	74 0d                	je     101346 <serial_putc+0x19>
        serial_putc_sub(c);
  101339:	8b 45 08             	mov    0x8(%ebp),%eax
  10133c:	89 04 24             	mov    %eax,(%esp)
  10133f:	e8 8d ff ff ff       	call   1012d1 <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  101344:	eb 24                	jmp    10136a <serial_putc+0x3d>
        serial_putc_sub('\b');
  101346:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10134d:	e8 7f ff ff ff       	call   1012d1 <serial_putc_sub>
        serial_putc_sub(' ');
  101352:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101359:	e8 73 ff ff ff       	call   1012d1 <serial_putc_sub>
        serial_putc_sub('\b');
  10135e:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101365:	e8 67 ff ff ff       	call   1012d1 <serial_putc_sub>
}
  10136a:	90                   	nop
  10136b:	89 ec                	mov    %ebp,%esp
  10136d:	5d                   	pop    %ebp
  10136e:	c3                   	ret    

0010136f <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  10136f:	55                   	push   %ebp
  101370:	89 e5                	mov    %esp,%ebp
  101372:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  101375:	eb 33                	jmp    1013aa <cons_intr+0x3b>
        if (c != 0) {
  101377:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10137b:	74 2d                	je     1013aa <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  10137d:	a1 84 00 11 00       	mov    0x110084,%eax
  101382:	8d 50 01             	lea    0x1(%eax),%edx
  101385:	89 15 84 00 11 00    	mov    %edx,0x110084
  10138b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10138e:	88 90 80 fe 10 00    	mov    %dl,0x10fe80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  101394:	a1 84 00 11 00       	mov    0x110084,%eax
  101399:	3d 00 02 00 00       	cmp    $0x200,%eax
  10139e:	75 0a                	jne    1013aa <cons_intr+0x3b>
                cons.wpos = 0;
  1013a0:	c7 05 84 00 11 00 00 	movl   $0x0,0x110084
  1013a7:	00 00 00 
    while ((c = (*proc)()) != -1) {
  1013aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1013ad:	ff d0                	call   *%eax
  1013af:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1013b2:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  1013b6:	75 bf                	jne    101377 <cons_intr+0x8>
            }
        }
    }
}
  1013b8:	90                   	nop
  1013b9:	90                   	nop
  1013ba:	89 ec                	mov    %ebp,%esp
  1013bc:	5d                   	pop    %ebp
  1013bd:	c3                   	ret    

001013be <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  1013be:	55                   	push   %ebp
  1013bf:	89 e5                	mov    %esp,%ebp
  1013c1:	83 ec 10             	sub    $0x10,%esp
  1013c4:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013ca:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1013ce:	89 c2                	mov    %eax,%edx
  1013d0:	ec                   	in     (%dx),%al
  1013d1:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1013d4:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  1013d8:	0f b6 c0             	movzbl %al,%eax
  1013db:	83 e0 01             	and    $0x1,%eax
  1013de:	85 c0                	test   %eax,%eax
  1013e0:	75 07                	jne    1013e9 <serial_proc_data+0x2b>
        return -1;
  1013e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013e7:	eb 2a                	jmp    101413 <serial_proc_data+0x55>
  1013e9:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013ef:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  1013f3:	89 c2                	mov    %eax,%edx
  1013f5:	ec                   	in     (%dx),%al
  1013f6:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  1013f9:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  1013fd:	0f b6 c0             	movzbl %al,%eax
  101400:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101403:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101407:	75 07                	jne    101410 <serial_proc_data+0x52>
        c = '\b';
  101409:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101410:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101413:	89 ec                	mov    %ebp,%esp
  101415:	5d                   	pop    %ebp
  101416:	c3                   	ret    

00101417 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101417:	55                   	push   %ebp
  101418:	89 e5                	mov    %esp,%ebp
  10141a:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  10141d:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101422:	85 c0                	test   %eax,%eax
  101424:	74 0c                	je     101432 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  101426:	c7 04 24 be 13 10 00 	movl   $0x1013be,(%esp)
  10142d:	e8 3d ff ff ff       	call   10136f <cons_intr>
    }
}
  101432:	90                   	nop
  101433:	89 ec                	mov    %ebp,%esp
  101435:	5d                   	pop    %ebp
  101436:	c3                   	ret    

00101437 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101437:	55                   	push   %ebp
  101438:	89 e5                	mov    %esp,%ebp
  10143a:	83 ec 38             	sub    $0x38,%esp
  10143d:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101443:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101446:	89 c2                	mov    %eax,%edx
  101448:	ec                   	in     (%dx),%al
  101449:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  10144c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  101450:	0f b6 c0             	movzbl %al,%eax
  101453:	83 e0 01             	and    $0x1,%eax
  101456:	85 c0                	test   %eax,%eax
  101458:	75 0a                	jne    101464 <kbd_proc_data+0x2d>
        return -1;
  10145a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10145f:	e9 56 01 00 00       	jmp    1015ba <kbd_proc_data+0x183>
  101464:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10146a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10146d:	89 c2                	mov    %eax,%edx
  10146f:	ec                   	in     (%dx),%al
  101470:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  101473:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  101477:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  10147a:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  10147e:	75 17                	jne    101497 <kbd_proc_data+0x60>
        // E0 escape character
        shift |= E0ESC;
  101480:	a1 88 00 11 00       	mov    0x110088,%eax
  101485:	83 c8 40             	or     $0x40,%eax
  101488:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  10148d:	b8 00 00 00 00       	mov    $0x0,%eax
  101492:	e9 23 01 00 00       	jmp    1015ba <kbd_proc_data+0x183>
    } else if (data & 0x80) {
  101497:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10149b:	84 c0                	test   %al,%al
  10149d:	79 45                	jns    1014e4 <kbd_proc_data+0xad>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  10149f:	a1 88 00 11 00       	mov    0x110088,%eax
  1014a4:	83 e0 40             	and    $0x40,%eax
  1014a7:	85 c0                	test   %eax,%eax
  1014a9:	75 08                	jne    1014b3 <kbd_proc_data+0x7c>
  1014ab:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014af:	24 7f                	and    $0x7f,%al
  1014b1:	eb 04                	jmp    1014b7 <kbd_proc_data+0x80>
  1014b3:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014b7:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  1014ba:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014be:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  1014c5:	0c 40                	or     $0x40,%al
  1014c7:	0f b6 c0             	movzbl %al,%eax
  1014ca:	f7 d0                	not    %eax
  1014cc:	89 c2                	mov    %eax,%edx
  1014ce:	a1 88 00 11 00       	mov    0x110088,%eax
  1014d3:	21 d0                	and    %edx,%eax
  1014d5:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  1014da:	b8 00 00 00 00       	mov    $0x0,%eax
  1014df:	e9 d6 00 00 00       	jmp    1015ba <kbd_proc_data+0x183>
    } else if (shift & E0ESC) {
  1014e4:	a1 88 00 11 00       	mov    0x110088,%eax
  1014e9:	83 e0 40             	and    $0x40,%eax
  1014ec:	85 c0                	test   %eax,%eax
  1014ee:	74 11                	je     101501 <kbd_proc_data+0xca>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  1014f0:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  1014f4:	a1 88 00 11 00       	mov    0x110088,%eax
  1014f9:	83 e0 bf             	and    $0xffffffbf,%eax
  1014fc:	a3 88 00 11 00       	mov    %eax,0x110088
    }

    shift |= shiftcode[data];
  101501:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101505:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  10150c:	0f b6 d0             	movzbl %al,%edx
  10150f:	a1 88 00 11 00       	mov    0x110088,%eax
  101514:	09 d0                	or     %edx,%eax
  101516:	a3 88 00 11 00       	mov    %eax,0x110088
    shift ^= togglecode[data];
  10151b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10151f:	0f b6 80 40 f1 10 00 	movzbl 0x10f140(%eax),%eax
  101526:	0f b6 d0             	movzbl %al,%edx
  101529:	a1 88 00 11 00       	mov    0x110088,%eax
  10152e:	31 d0                	xor    %edx,%eax
  101530:	a3 88 00 11 00       	mov    %eax,0x110088

    c = charcode[shift & (CTL | SHIFT)][data];
  101535:	a1 88 00 11 00       	mov    0x110088,%eax
  10153a:	83 e0 03             	and    $0x3,%eax
  10153d:	8b 14 85 40 f5 10 00 	mov    0x10f540(,%eax,4),%edx
  101544:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101548:	01 d0                	add    %edx,%eax
  10154a:	0f b6 00             	movzbl (%eax),%eax
  10154d:	0f b6 c0             	movzbl %al,%eax
  101550:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  101553:	a1 88 00 11 00       	mov    0x110088,%eax
  101558:	83 e0 08             	and    $0x8,%eax
  10155b:	85 c0                	test   %eax,%eax
  10155d:	74 22                	je     101581 <kbd_proc_data+0x14a>
        if ('a' <= c && c <= 'z')
  10155f:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  101563:	7e 0c                	jle    101571 <kbd_proc_data+0x13a>
  101565:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  101569:	7f 06                	jg     101571 <kbd_proc_data+0x13a>
            c += 'A' - 'a';
  10156b:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  10156f:	eb 10                	jmp    101581 <kbd_proc_data+0x14a>
        else if ('A' <= c && c <= 'Z')
  101571:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  101575:	7e 0a                	jle    101581 <kbd_proc_data+0x14a>
  101577:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  10157b:	7f 04                	jg     101581 <kbd_proc_data+0x14a>
            c += 'a' - 'A';
  10157d:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101581:	a1 88 00 11 00       	mov    0x110088,%eax
  101586:	f7 d0                	not    %eax
  101588:	83 e0 06             	and    $0x6,%eax
  10158b:	85 c0                	test   %eax,%eax
  10158d:	75 28                	jne    1015b7 <kbd_proc_data+0x180>
  10158f:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101596:	75 1f                	jne    1015b7 <kbd_proc_data+0x180>
        cprintf("Rebooting!\n");
  101598:	c7 04 24 f3 38 10 00 	movl   $0x1038f3,(%esp)
  10159f:	e8 7c ed ff ff       	call   100320 <cprintf>
  1015a4:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  1015aa:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1015ae:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  1015b2:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1015b5:	ee                   	out    %al,(%dx)
}
  1015b6:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  1015b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1015ba:	89 ec                	mov    %ebp,%esp
  1015bc:	5d                   	pop    %ebp
  1015bd:	c3                   	ret    

001015be <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  1015be:	55                   	push   %ebp
  1015bf:	89 e5                	mov    %esp,%ebp
  1015c1:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  1015c4:	c7 04 24 37 14 10 00 	movl   $0x101437,(%esp)
  1015cb:	e8 9f fd ff ff       	call   10136f <cons_intr>
}
  1015d0:	90                   	nop
  1015d1:	89 ec                	mov    %ebp,%esp
  1015d3:	5d                   	pop    %ebp
  1015d4:	c3                   	ret    

001015d5 <kbd_init>:

static void
kbd_init(void) {
  1015d5:	55                   	push   %ebp
  1015d6:	89 e5                	mov    %esp,%ebp
  1015d8:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  1015db:	e8 de ff ff ff       	call   1015be <kbd_intr>
    pic_enable(IRQ_KBD);
  1015e0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1015e7:	e8 2b 01 00 00       	call   101717 <pic_enable>
}
  1015ec:	90                   	nop
  1015ed:	89 ec                	mov    %ebp,%esp
  1015ef:	5d                   	pop    %ebp
  1015f0:	c3                   	ret    

001015f1 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  1015f1:	55                   	push   %ebp
  1015f2:	89 e5                	mov    %esp,%ebp
  1015f4:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  1015f7:	e8 4a f8 ff ff       	call   100e46 <cga_init>
    serial_init();
  1015fc:	e8 2d f9 ff ff       	call   100f2e <serial_init>
    kbd_init();
  101601:	e8 cf ff ff ff       	call   1015d5 <kbd_init>
    if (!serial_exists) {
  101606:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  10160b:	85 c0                	test   %eax,%eax
  10160d:	75 0c                	jne    10161b <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  10160f:	c7 04 24 ff 38 10 00 	movl   $0x1038ff,(%esp)
  101616:	e8 05 ed ff ff       	call   100320 <cprintf>
    }
}
  10161b:	90                   	nop
  10161c:	89 ec                	mov    %ebp,%esp
  10161e:	5d                   	pop    %ebp
  10161f:	c3                   	ret    

00101620 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101620:	55                   	push   %ebp
  101621:	89 e5                	mov    %esp,%ebp
  101623:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  101626:	8b 45 08             	mov    0x8(%ebp),%eax
  101629:	89 04 24             	mov    %eax,(%esp)
  10162c:	e8 68 fa ff ff       	call   101099 <lpt_putc>
    cga_putc(c);
  101631:	8b 45 08             	mov    0x8(%ebp),%eax
  101634:	89 04 24             	mov    %eax,(%esp)
  101637:	e8 9f fa ff ff       	call   1010db <cga_putc>
    serial_putc(c);
  10163c:	8b 45 08             	mov    0x8(%ebp),%eax
  10163f:	89 04 24             	mov    %eax,(%esp)
  101642:	e8 e6 fc ff ff       	call   10132d <serial_putc>
}
  101647:	90                   	nop
  101648:	89 ec                	mov    %ebp,%esp
  10164a:	5d                   	pop    %ebp
  10164b:	c3                   	ret    

0010164c <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  10164c:	55                   	push   %ebp
  10164d:	89 e5                	mov    %esp,%ebp
  10164f:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  101652:	e8 c0 fd ff ff       	call   101417 <serial_intr>
    kbd_intr();
  101657:	e8 62 ff ff ff       	call   1015be <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  10165c:	8b 15 80 00 11 00    	mov    0x110080,%edx
  101662:	a1 84 00 11 00       	mov    0x110084,%eax
  101667:	39 c2                	cmp    %eax,%edx
  101669:	74 36                	je     1016a1 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  10166b:	a1 80 00 11 00       	mov    0x110080,%eax
  101670:	8d 50 01             	lea    0x1(%eax),%edx
  101673:	89 15 80 00 11 00    	mov    %edx,0x110080
  101679:	0f b6 80 80 fe 10 00 	movzbl 0x10fe80(%eax),%eax
  101680:	0f b6 c0             	movzbl %al,%eax
  101683:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  101686:	a1 80 00 11 00       	mov    0x110080,%eax
  10168b:	3d 00 02 00 00       	cmp    $0x200,%eax
  101690:	75 0a                	jne    10169c <cons_getc+0x50>
            cons.rpos = 0;
  101692:	c7 05 80 00 11 00 00 	movl   $0x0,0x110080
  101699:	00 00 00 
        }
        return c;
  10169c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10169f:	eb 05                	jmp    1016a6 <cons_getc+0x5a>
    }
    return 0;
  1016a1:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1016a6:	89 ec                	mov    %ebp,%esp
  1016a8:	5d                   	pop    %ebp
  1016a9:	c3                   	ret    

001016aa <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1016aa:	55                   	push   %ebp
  1016ab:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1016ad:	fb                   	sti    
}
  1016ae:	90                   	nop
    sti();
}
  1016af:	90                   	nop
  1016b0:	5d                   	pop    %ebp
  1016b1:	c3                   	ret    

001016b2 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1016b2:	55                   	push   %ebp
  1016b3:	89 e5                	mov    %esp,%ebp

static inline void
cli(void) {
    asm volatile ("cli");
  1016b5:	fa                   	cli    
}
  1016b6:	90                   	nop
    cli();
}
  1016b7:	90                   	nop
  1016b8:	5d                   	pop    %ebp
  1016b9:	c3                   	ret    

001016ba <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  1016ba:	55                   	push   %ebp
  1016bb:	89 e5                	mov    %esp,%ebp
  1016bd:	83 ec 14             	sub    $0x14,%esp
  1016c0:	8b 45 08             	mov    0x8(%ebp),%eax
  1016c3:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  1016c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1016ca:	66 a3 50 f5 10 00    	mov    %ax,0x10f550
    if (did_init) {
  1016d0:	a1 8c 00 11 00       	mov    0x11008c,%eax
  1016d5:	85 c0                	test   %eax,%eax
  1016d7:	74 39                	je     101712 <pic_setmask+0x58>
        outb(IO_PIC1 + 1, mask);
  1016d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1016dc:	0f b6 c0             	movzbl %al,%eax
  1016df:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  1016e5:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016e8:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1016ec:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016f0:	ee                   	out    %al,(%dx)
}
  1016f1:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  1016f2:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1016f6:	c1 e8 08             	shr    $0x8,%eax
  1016f9:	0f b7 c0             	movzwl %ax,%eax
  1016fc:	0f b6 c0             	movzbl %al,%eax
  1016ff:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  101705:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101708:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  10170c:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101710:	ee                   	out    %al,(%dx)
}
  101711:	90                   	nop
    }
}
  101712:	90                   	nop
  101713:	89 ec                	mov    %ebp,%esp
  101715:	5d                   	pop    %ebp
  101716:	c3                   	ret    

00101717 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101717:	55                   	push   %ebp
  101718:	89 e5                	mov    %esp,%ebp
  10171a:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  10171d:	8b 45 08             	mov    0x8(%ebp),%eax
  101720:	ba 01 00 00 00       	mov    $0x1,%edx
  101725:	88 c1                	mov    %al,%cl
  101727:	d3 e2                	shl    %cl,%edx
  101729:	89 d0                	mov    %edx,%eax
  10172b:	98                   	cwtl   
  10172c:	f7 d0                	not    %eax
  10172e:	0f bf d0             	movswl %ax,%edx
  101731:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  101738:	98                   	cwtl   
  101739:	21 d0                	and    %edx,%eax
  10173b:	98                   	cwtl   
  10173c:	0f b7 c0             	movzwl %ax,%eax
  10173f:	89 04 24             	mov    %eax,(%esp)
  101742:	e8 73 ff ff ff       	call   1016ba <pic_setmask>
}
  101747:	90                   	nop
  101748:	89 ec                	mov    %ebp,%esp
  10174a:	5d                   	pop    %ebp
  10174b:	c3                   	ret    

0010174c <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  10174c:	55                   	push   %ebp
  10174d:	89 e5                	mov    %esp,%ebp
  10174f:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  101752:	c7 05 8c 00 11 00 01 	movl   $0x1,0x11008c
  101759:	00 00 00 
  10175c:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  101762:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101766:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  10176a:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  10176e:	ee                   	out    %al,(%dx)
}
  10176f:	90                   	nop
  101770:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  101776:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10177a:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  10177e:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  101782:	ee                   	out    %al,(%dx)
}
  101783:	90                   	nop
  101784:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  10178a:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10178e:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101792:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  101796:	ee                   	out    %al,(%dx)
}
  101797:	90                   	nop
  101798:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  10179e:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017a2:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  1017a6:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  1017aa:	ee                   	out    %al,(%dx)
}
  1017ab:	90                   	nop
  1017ac:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  1017b2:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017b6:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  1017ba:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  1017be:	ee                   	out    %al,(%dx)
}
  1017bf:	90                   	nop
  1017c0:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  1017c6:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017ca:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  1017ce:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  1017d2:	ee                   	out    %al,(%dx)
}
  1017d3:	90                   	nop
  1017d4:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  1017da:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017de:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  1017e2:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  1017e6:	ee                   	out    %al,(%dx)
}
  1017e7:	90                   	nop
  1017e8:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  1017ee:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017f2:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1017f6:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1017fa:	ee                   	out    %al,(%dx)
}
  1017fb:	90                   	nop
  1017fc:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  101802:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101806:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10180a:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10180e:	ee                   	out    %al,(%dx)
}
  10180f:	90                   	nop
  101810:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  101816:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10181a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10181e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101822:	ee                   	out    %al,(%dx)
}
  101823:	90                   	nop
  101824:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  10182a:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10182e:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101832:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101836:	ee                   	out    %al,(%dx)
}
  101837:	90                   	nop
  101838:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  10183e:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101842:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101846:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10184a:	ee                   	out    %al,(%dx)
}
  10184b:	90                   	nop
  10184c:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  101852:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101856:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10185a:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10185e:	ee                   	out    %al,(%dx)
}
  10185f:	90                   	nop
  101860:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  101866:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10186a:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  10186e:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101872:	ee                   	out    %al,(%dx)
}
  101873:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  101874:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  10187b:	3d ff ff 00 00       	cmp    $0xffff,%eax
  101880:	74 0f                	je     101891 <pic_init+0x145>
        pic_setmask(irq_mask);
  101882:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  101889:	89 04 24             	mov    %eax,(%esp)
  10188c:	e8 29 fe ff ff       	call   1016ba <pic_setmask>
    }
}
  101891:	90                   	nop
  101892:	89 ec                	mov    %ebp,%esp
  101894:	5d                   	pop    %ebp
  101895:	c3                   	ret    

00101896 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  101896:	55                   	push   %ebp
  101897:	89 e5                	mov    %esp,%ebp
  101899:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  10189c:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  1018a3:	00 
  1018a4:	c7 04 24 20 39 10 00 	movl   $0x103920,(%esp)
  1018ab:	e8 70 ea ff ff       	call   100320 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
  1018b0:	c7 04 24 2a 39 10 00 	movl   $0x10392a,(%esp)
  1018b7:	e8 64 ea ff ff       	call   100320 <cprintf>
    panic("EOT: kernel seems ok.");
  1018bc:	c7 44 24 08 38 39 10 	movl   $0x103938,0x8(%esp)
  1018c3:	00 
  1018c4:	c7 44 24 04 12 00 00 	movl   $0x12,0x4(%esp)
  1018cb:	00 
  1018cc:	c7 04 24 4e 39 10 00 	movl   $0x10394e,(%esp)
  1018d3:	e8 e9 f3 ff ff       	call   100cc1 <__panic>

001018d8 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  1018d8:	55                   	push   %ebp
  1018d9:	89 e5                	mov    %esp,%ebp
  1018db:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    extern uintptr_t __vectors[];

    for (int i = 0; i < 32; i++) {
  1018de:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1018e5:	e9 c1 00 00 00       	jmp    1019ab <idt_init+0xd3>
        SETGATE(idt[i], 1, GD_KTEXT, __vectors[i], DPL_KERNEL);
  1018ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018ed:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  1018f4:	0f b7 d0             	movzwl %ax,%edx
  1018f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018fa:	66 89 14 c5 a0 00 11 	mov    %dx,0x1100a0(,%eax,8)
  101901:	00 
  101902:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101905:	66 c7 04 c5 a2 00 11 	movw   $0x8,0x1100a2(,%eax,8)
  10190c:	00 08 00 
  10190f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101912:	0f b6 14 c5 a4 00 11 	movzbl 0x1100a4(,%eax,8),%edx
  101919:	00 
  10191a:	80 e2 e0             	and    $0xe0,%dl
  10191d:	88 14 c5 a4 00 11 00 	mov    %dl,0x1100a4(,%eax,8)
  101924:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101927:	0f b6 14 c5 a4 00 11 	movzbl 0x1100a4(,%eax,8),%edx
  10192e:	00 
  10192f:	80 e2 1f             	and    $0x1f,%dl
  101932:	88 14 c5 a4 00 11 00 	mov    %dl,0x1100a4(,%eax,8)
  101939:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10193c:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  101943:	00 
  101944:	80 ca 0f             	or     $0xf,%dl
  101947:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  10194e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101951:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  101958:	00 
  101959:	80 e2 ef             	and    $0xef,%dl
  10195c:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  101963:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101966:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  10196d:	00 
  10196e:	80 e2 9f             	and    $0x9f,%dl
  101971:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  101978:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10197b:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  101982:	00 
  101983:	80 ca 80             	or     $0x80,%dl
  101986:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  10198d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101990:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  101997:	c1 e8 10             	shr    $0x10,%eax
  10199a:	0f b7 d0             	movzwl %ax,%edx
  10199d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019a0:	66 89 14 c5 a6 00 11 	mov    %dx,0x1100a6(,%eax,8)
  1019a7:	00 
    for (int i = 0; i < 32; i++) {
  1019a8:	ff 45 fc             	incl   -0x4(%ebp)
  1019ab:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%ebp)
  1019af:	0f 8e 35 ff ff ff    	jle    1018ea <idt_init+0x12>
    }
    for (int i = 32; i < 256; i++) {
  1019b5:	c7 45 f8 20 00 00 00 	movl   $0x20,-0x8(%ebp)
  1019bc:	e9 c4 00 00 00       	jmp    101a85 <idt_init+0x1ad>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  1019c1:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1019c4:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  1019cb:	0f b7 d0             	movzwl %ax,%edx
  1019ce:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1019d1:	66 89 14 c5 a0 00 11 	mov    %dx,0x1100a0(,%eax,8)
  1019d8:	00 
  1019d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1019dc:	66 c7 04 c5 a2 00 11 	movw   $0x8,0x1100a2(,%eax,8)
  1019e3:	00 08 00 
  1019e6:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1019e9:	0f b6 14 c5 a4 00 11 	movzbl 0x1100a4(,%eax,8),%edx
  1019f0:	00 
  1019f1:	80 e2 e0             	and    $0xe0,%dl
  1019f4:	88 14 c5 a4 00 11 00 	mov    %dl,0x1100a4(,%eax,8)
  1019fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1019fe:	0f b6 14 c5 a4 00 11 	movzbl 0x1100a4(,%eax,8),%edx
  101a05:	00 
  101a06:	80 e2 1f             	and    $0x1f,%dl
  101a09:	88 14 c5 a4 00 11 00 	mov    %dl,0x1100a4(,%eax,8)
  101a10:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101a13:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  101a1a:	00 
  101a1b:	80 e2 f0             	and    $0xf0,%dl
  101a1e:	80 ca 0e             	or     $0xe,%dl
  101a21:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  101a28:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101a2b:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  101a32:	00 
  101a33:	80 e2 ef             	and    $0xef,%dl
  101a36:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  101a3d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101a40:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  101a47:	00 
  101a48:	80 e2 9f             	and    $0x9f,%dl
  101a4b:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  101a52:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101a55:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  101a5c:	00 
  101a5d:	80 ca 80             	or     $0x80,%dl
  101a60:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  101a67:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101a6a:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  101a71:	c1 e8 10             	shr    $0x10,%eax
  101a74:	0f b7 d0             	movzwl %ax,%edx
  101a77:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101a7a:	66 89 14 c5 a6 00 11 	mov    %dx,0x1100a6(,%eax,8)
  101a81:	00 
    for (int i = 32; i < 256; i++) {
  101a82:	ff 45 f8             	incl   -0x8(%ebp)
  101a85:	81 7d f8 ff 00 00 00 	cmpl   $0xff,-0x8(%ebp)
  101a8c:	0f 8e 2f ff ff ff    	jle    1019c1 <idt_init+0xe9>
  101a92:	c7 45 f4 60 f5 10 00 	movl   $0x10f560,-0xc(%ebp)
    asm volatile ("lidt (%0)" :: "r" (pd));
  101a99:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a9c:	0f 01 18             	lidtl  (%eax)
}
  101a9f:	90                   	nop
    }

    lidt(&idt_pd);
}
  101aa0:	90                   	nop
  101aa1:	89 ec                	mov    %ebp,%esp
  101aa3:	5d                   	pop    %ebp
  101aa4:	c3                   	ret    

00101aa5 <trapname>:

static const char *
trapname(int trapno) {
  101aa5:	55                   	push   %ebp
  101aa6:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101aa8:	8b 45 08             	mov    0x8(%ebp),%eax
  101aab:	83 f8 13             	cmp    $0x13,%eax
  101aae:	77 0c                	ja     101abc <trapname+0x17>
        return excnames[trapno];
  101ab0:	8b 45 08             	mov    0x8(%ebp),%eax
  101ab3:	8b 04 85 a0 3c 10 00 	mov    0x103ca0(,%eax,4),%eax
  101aba:	eb 18                	jmp    101ad4 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101abc:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101ac0:	7e 0d                	jle    101acf <trapname+0x2a>
  101ac2:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101ac6:	7f 07                	jg     101acf <trapname+0x2a>
        return "Hardware Interrupt";
  101ac8:	b8 5f 39 10 00       	mov    $0x10395f,%eax
  101acd:	eb 05                	jmp    101ad4 <trapname+0x2f>
    }
    return "(unknown trap)";
  101acf:	b8 72 39 10 00       	mov    $0x103972,%eax
}
  101ad4:	5d                   	pop    %ebp
  101ad5:	c3                   	ret    

00101ad6 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101ad6:	55                   	push   %ebp
  101ad7:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101ad9:	8b 45 08             	mov    0x8(%ebp),%eax
  101adc:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101ae0:	83 f8 08             	cmp    $0x8,%eax
  101ae3:	0f 94 c0             	sete   %al
  101ae6:	0f b6 c0             	movzbl %al,%eax
}
  101ae9:	5d                   	pop    %ebp
  101aea:	c3                   	ret    

00101aeb <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101aeb:	55                   	push   %ebp
  101aec:	89 e5                	mov    %esp,%ebp
  101aee:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101af1:	8b 45 08             	mov    0x8(%ebp),%eax
  101af4:	89 44 24 04          	mov    %eax,0x4(%esp)
  101af8:	c7 04 24 b3 39 10 00 	movl   $0x1039b3,(%esp)
  101aff:	e8 1c e8 ff ff       	call   100320 <cprintf>
    print_regs(&tf->tf_regs);
  101b04:	8b 45 08             	mov    0x8(%ebp),%eax
  101b07:	89 04 24             	mov    %eax,(%esp)
  101b0a:	e8 8f 01 00 00       	call   101c9e <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101b0f:	8b 45 08             	mov    0x8(%ebp),%eax
  101b12:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101b16:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b1a:	c7 04 24 c4 39 10 00 	movl   $0x1039c4,(%esp)
  101b21:	e8 fa e7 ff ff       	call   100320 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101b26:	8b 45 08             	mov    0x8(%ebp),%eax
  101b29:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101b2d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b31:	c7 04 24 d7 39 10 00 	movl   $0x1039d7,(%esp)
  101b38:	e8 e3 e7 ff ff       	call   100320 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101b3d:	8b 45 08             	mov    0x8(%ebp),%eax
  101b40:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101b44:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b48:	c7 04 24 ea 39 10 00 	movl   $0x1039ea,(%esp)
  101b4f:	e8 cc e7 ff ff       	call   100320 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101b54:	8b 45 08             	mov    0x8(%ebp),%eax
  101b57:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101b5b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b5f:	c7 04 24 fd 39 10 00 	movl   $0x1039fd,(%esp)
  101b66:	e8 b5 e7 ff ff       	call   100320 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101b6b:	8b 45 08             	mov    0x8(%ebp),%eax
  101b6e:	8b 40 30             	mov    0x30(%eax),%eax
  101b71:	89 04 24             	mov    %eax,(%esp)
  101b74:	e8 2c ff ff ff       	call   101aa5 <trapname>
  101b79:	8b 55 08             	mov    0x8(%ebp),%edx
  101b7c:	8b 52 30             	mov    0x30(%edx),%edx
  101b7f:	89 44 24 08          	mov    %eax,0x8(%esp)
  101b83:	89 54 24 04          	mov    %edx,0x4(%esp)
  101b87:	c7 04 24 10 3a 10 00 	movl   $0x103a10,(%esp)
  101b8e:	e8 8d e7 ff ff       	call   100320 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101b93:	8b 45 08             	mov    0x8(%ebp),%eax
  101b96:	8b 40 34             	mov    0x34(%eax),%eax
  101b99:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b9d:	c7 04 24 22 3a 10 00 	movl   $0x103a22,(%esp)
  101ba4:	e8 77 e7 ff ff       	call   100320 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101ba9:	8b 45 08             	mov    0x8(%ebp),%eax
  101bac:	8b 40 38             	mov    0x38(%eax),%eax
  101baf:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bb3:	c7 04 24 31 3a 10 00 	movl   $0x103a31,(%esp)
  101bba:	e8 61 e7 ff ff       	call   100320 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101bbf:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc2:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101bc6:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bca:	c7 04 24 40 3a 10 00 	movl   $0x103a40,(%esp)
  101bd1:	e8 4a e7 ff ff       	call   100320 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101bd6:	8b 45 08             	mov    0x8(%ebp),%eax
  101bd9:	8b 40 40             	mov    0x40(%eax),%eax
  101bdc:	89 44 24 04          	mov    %eax,0x4(%esp)
  101be0:	c7 04 24 53 3a 10 00 	movl   $0x103a53,(%esp)
  101be7:	e8 34 e7 ff ff       	call   100320 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101bec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101bf3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101bfa:	eb 3d                	jmp    101c39 <print_trapframe+0x14e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101bfc:	8b 45 08             	mov    0x8(%ebp),%eax
  101bff:	8b 50 40             	mov    0x40(%eax),%edx
  101c02:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101c05:	21 d0                	and    %edx,%eax
  101c07:	85 c0                	test   %eax,%eax
  101c09:	74 28                	je     101c33 <print_trapframe+0x148>
  101c0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c0e:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101c15:	85 c0                	test   %eax,%eax
  101c17:	74 1a                	je     101c33 <print_trapframe+0x148>
            cprintf("%s,", IA32flags[i]);
  101c19:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c1c:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101c23:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c27:	c7 04 24 62 3a 10 00 	movl   $0x103a62,(%esp)
  101c2e:	e8 ed e6 ff ff       	call   100320 <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101c33:	ff 45 f4             	incl   -0xc(%ebp)
  101c36:	d1 65 f0             	shll   -0x10(%ebp)
  101c39:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c3c:	83 f8 17             	cmp    $0x17,%eax
  101c3f:	76 bb                	jbe    101bfc <print_trapframe+0x111>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101c41:	8b 45 08             	mov    0x8(%ebp),%eax
  101c44:	8b 40 40             	mov    0x40(%eax),%eax
  101c47:	c1 e8 0c             	shr    $0xc,%eax
  101c4a:	83 e0 03             	and    $0x3,%eax
  101c4d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c51:	c7 04 24 66 3a 10 00 	movl   $0x103a66,(%esp)
  101c58:	e8 c3 e6 ff ff       	call   100320 <cprintf>

    if (!trap_in_kernel(tf)) {
  101c5d:	8b 45 08             	mov    0x8(%ebp),%eax
  101c60:	89 04 24             	mov    %eax,(%esp)
  101c63:	e8 6e fe ff ff       	call   101ad6 <trap_in_kernel>
  101c68:	85 c0                	test   %eax,%eax
  101c6a:	75 2d                	jne    101c99 <print_trapframe+0x1ae>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101c6c:	8b 45 08             	mov    0x8(%ebp),%eax
  101c6f:	8b 40 44             	mov    0x44(%eax),%eax
  101c72:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c76:	c7 04 24 6f 3a 10 00 	movl   $0x103a6f,(%esp)
  101c7d:	e8 9e e6 ff ff       	call   100320 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101c82:	8b 45 08             	mov    0x8(%ebp),%eax
  101c85:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101c89:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c8d:	c7 04 24 7e 3a 10 00 	movl   $0x103a7e,(%esp)
  101c94:	e8 87 e6 ff ff       	call   100320 <cprintf>
    }
}
  101c99:	90                   	nop
  101c9a:	89 ec                	mov    %ebp,%esp
  101c9c:	5d                   	pop    %ebp
  101c9d:	c3                   	ret    

00101c9e <print_regs>:

void
print_regs(struct pushregs *regs) {
  101c9e:	55                   	push   %ebp
  101c9f:	89 e5                	mov    %esp,%ebp
  101ca1:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101ca4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ca7:	8b 00                	mov    (%eax),%eax
  101ca9:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cad:	c7 04 24 91 3a 10 00 	movl   $0x103a91,(%esp)
  101cb4:	e8 67 e6 ff ff       	call   100320 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101cb9:	8b 45 08             	mov    0x8(%ebp),%eax
  101cbc:	8b 40 04             	mov    0x4(%eax),%eax
  101cbf:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cc3:	c7 04 24 a0 3a 10 00 	movl   $0x103aa0,(%esp)
  101cca:	e8 51 e6 ff ff       	call   100320 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101ccf:	8b 45 08             	mov    0x8(%ebp),%eax
  101cd2:	8b 40 08             	mov    0x8(%eax),%eax
  101cd5:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cd9:	c7 04 24 af 3a 10 00 	movl   $0x103aaf,(%esp)
  101ce0:	e8 3b e6 ff ff       	call   100320 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101ce5:	8b 45 08             	mov    0x8(%ebp),%eax
  101ce8:	8b 40 0c             	mov    0xc(%eax),%eax
  101ceb:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cef:	c7 04 24 be 3a 10 00 	movl   $0x103abe,(%esp)
  101cf6:	e8 25 e6 ff ff       	call   100320 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101cfb:	8b 45 08             	mov    0x8(%ebp),%eax
  101cfe:	8b 40 10             	mov    0x10(%eax),%eax
  101d01:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d05:	c7 04 24 cd 3a 10 00 	movl   $0x103acd,(%esp)
  101d0c:	e8 0f e6 ff ff       	call   100320 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101d11:	8b 45 08             	mov    0x8(%ebp),%eax
  101d14:	8b 40 14             	mov    0x14(%eax),%eax
  101d17:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d1b:	c7 04 24 dc 3a 10 00 	movl   $0x103adc,(%esp)
  101d22:	e8 f9 e5 ff ff       	call   100320 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101d27:	8b 45 08             	mov    0x8(%ebp),%eax
  101d2a:	8b 40 18             	mov    0x18(%eax),%eax
  101d2d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d31:	c7 04 24 eb 3a 10 00 	movl   $0x103aeb,(%esp)
  101d38:	e8 e3 e5 ff ff       	call   100320 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101d3d:	8b 45 08             	mov    0x8(%ebp),%eax
  101d40:	8b 40 1c             	mov    0x1c(%eax),%eax
  101d43:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d47:	c7 04 24 fa 3a 10 00 	movl   $0x103afa,(%esp)
  101d4e:	e8 cd e5 ff ff       	call   100320 <cprintf>
}
  101d53:	90                   	nop
  101d54:	89 ec                	mov    %ebp,%esp
  101d56:	5d                   	pop    %ebp
  101d57:	c3                   	ret    

00101d58 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101d58:	55                   	push   %ebp
  101d59:	89 e5                	mov    %esp,%ebp
  101d5b:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101d5e:	8b 45 08             	mov    0x8(%ebp),%eax
  101d61:	8b 40 30             	mov    0x30(%eax),%eax
  101d64:	83 f8 79             	cmp    $0x79,%eax
  101d67:	0f 87 e6 00 00 00    	ja     101e53 <trap_dispatch+0xfb>
  101d6d:	83 f8 78             	cmp    $0x78,%eax
  101d70:	0f 83 c1 00 00 00    	jae    101e37 <trap_dispatch+0xdf>
  101d76:	83 f8 2f             	cmp    $0x2f,%eax
  101d79:	0f 87 d4 00 00 00    	ja     101e53 <trap_dispatch+0xfb>
  101d7f:	83 f8 2e             	cmp    $0x2e,%eax
  101d82:	0f 83 00 01 00 00    	jae    101e88 <trap_dispatch+0x130>
  101d88:	83 f8 24             	cmp    $0x24,%eax
  101d8b:	74 5e                	je     101deb <trap_dispatch+0x93>
  101d8d:	83 f8 24             	cmp    $0x24,%eax
  101d90:	0f 87 bd 00 00 00    	ja     101e53 <trap_dispatch+0xfb>
  101d96:	83 f8 20             	cmp    $0x20,%eax
  101d99:	74 0a                	je     101da5 <trap_dispatch+0x4d>
  101d9b:	83 f8 21             	cmp    $0x21,%eax
  101d9e:	74 71                	je     101e11 <trap_dispatch+0xb9>
  101da0:	e9 ae 00 00 00       	jmp    101e53 <trap_dispatch+0xfb>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ticks++;
  101da5:	a1 44 fe 10 00       	mov    0x10fe44,%eax
  101daa:	40                   	inc    %eax
  101dab:	a3 44 fe 10 00       	mov    %eax,0x10fe44
        if (ticks % TICK_NUM == 0) {
  101db0:	8b 0d 44 fe 10 00    	mov    0x10fe44,%ecx
  101db6:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101dbb:	89 c8                	mov    %ecx,%eax
  101dbd:	f7 e2                	mul    %edx
  101dbf:	c1 ea 05             	shr    $0x5,%edx
  101dc2:	89 d0                	mov    %edx,%eax
  101dc4:	c1 e0 02             	shl    $0x2,%eax
  101dc7:	01 d0                	add    %edx,%eax
  101dc9:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  101dd0:	01 d0                	add    %edx,%eax
  101dd2:	c1 e0 02             	shl    $0x2,%eax
  101dd5:	29 c1                	sub    %eax,%ecx
  101dd7:	89 ca                	mov    %ecx,%edx
  101dd9:	85 d2                	test   %edx,%edx
  101ddb:	0f 85 aa 00 00 00    	jne    101e8b <trap_dispatch+0x133>
            print_ticks();
  101de1:	e8 b0 fa ff ff       	call   101896 <print_ticks>
        }
        break;
  101de6:	e9 a0 00 00 00       	jmp    101e8b <trap_dispatch+0x133>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101deb:	e8 5c f8 ff ff       	call   10164c <cons_getc>
  101df0:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101df3:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101df7:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101dfb:	89 54 24 08          	mov    %edx,0x8(%esp)
  101dff:	89 44 24 04          	mov    %eax,0x4(%esp)
  101e03:	c7 04 24 09 3b 10 00 	movl   $0x103b09,(%esp)
  101e0a:	e8 11 e5 ff ff       	call   100320 <cprintf>
        break;
  101e0f:	eb 7b                	jmp    101e8c <trap_dispatch+0x134>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101e11:	e8 36 f8 ff ff       	call   10164c <cons_getc>
  101e16:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101e19:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101e1d:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101e21:	89 54 24 08          	mov    %edx,0x8(%esp)
  101e25:	89 44 24 04          	mov    %eax,0x4(%esp)
  101e29:	c7 04 24 1b 3b 10 00 	movl   $0x103b1b,(%esp)
  101e30:	e8 eb e4 ff ff       	call   100320 <cprintf>
        break;
  101e35:	eb 55                	jmp    101e8c <trap_dispatch+0x134>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101e37:	c7 44 24 08 2a 3b 10 	movl   $0x103b2a,0x8(%esp)
  101e3e:	00 
  101e3f:	c7 44 24 04 b0 00 00 	movl   $0xb0,0x4(%esp)
  101e46:	00 
  101e47:	c7 04 24 4e 39 10 00 	movl   $0x10394e,(%esp)
  101e4e:	e8 6e ee ff ff       	call   100cc1 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101e53:	8b 45 08             	mov    0x8(%ebp),%eax
  101e56:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e5a:	83 e0 03             	and    $0x3,%eax
  101e5d:	85 c0                	test   %eax,%eax
  101e5f:	75 2b                	jne    101e8c <trap_dispatch+0x134>
            print_trapframe(tf);
  101e61:	8b 45 08             	mov    0x8(%ebp),%eax
  101e64:	89 04 24             	mov    %eax,(%esp)
  101e67:	e8 7f fc ff ff       	call   101aeb <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101e6c:	c7 44 24 08 3a 3b 10 	movl   $0x103b3a,0x8(%esp)
  101e73:	00 
  101e74:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
  101e7b:	00 
  101e7c:	c7 04 24 4e 39 10 00 	movl   $0x10394e,(%esp)
  101e83:	e8 39 ee ff ff       	call   100cc1 <__panic>
        break;
  101e88:	90                   	nop
  101e89:	eb 01                	jmp    101e8c <trap_dispatch+0x134>
        break;
  101e8b:	90                   	nop
        }
    }
}
  101e8c:	90                   	nop
  101e8d:	89 ec                	mov    %ebp,%esp
  101e8f:	5d                   	pop    %ebp
  101e90:	c3                   	ret    

00101e91 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101e91:	55                   	push   %ebp
  101e92:	89 e5                	mov    %esp,%ebp
  101e94:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101e97:	8b 45 08             	mov    0x8(%ebp),%eax
  101e9a:	89 04 24             	mov    %eax,(%esp)
  101e9d:	e8 b6 fe ff ff       	call   101d58 <trap_dispatch>
}
  101ea2:	90                   	nop
  101ea3:	89 ec                	mov    %ebp,%esp
  101ea5:	5d                   	pop    %ebp
  101ea6:	c3                   	ret    

00101ea7 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101ea7:	1e                   	push   %ds
    pushl %es
  101ea8:	06                   	push   %es
    pushl %fs
  101ea9:	0f a0                	push   %fs
    pushl %gs
  101eab:	0f a8                	push   %gs
    pushal
  101ead:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101eae:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101eb3:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101eb5:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101eb7:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101eb8:	e8 d4 ff ff ff       	call   101e91 <trap>

    # pop the pushed stack pointer
    popl %esp
  101ebd:	5c                   	pop    %esp

00101ebe <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101ebe:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101ebf:	0f a9                	pop    %gs
    popl %fs
  101ec1:	0f a1                	pop    %fs
    popl %es
  101ec3:	07                   	pop    %es
    popl %ds
  101ec4:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101ec5:	83 c4 08             	add    $0x8,%esp
    iret
  101ec8:	cf                   	iret   

00101ec9 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101ec9:	6a 00                	push   $0x0
  pushl $0
  101ecb:	6a 00                	push   $0x0
  jmp __alltraps
  101ecd:	e9 d5 ff ff ff       	jmp    101ea7 <__alltraps>

00101ed2 <vector1>:
.globl vector1
vector1:
  pushl $0
  101ed2:	6a 00                	push   $0x0
  pushl $1
  101ed4:	6a 01                	push   $0x1
  jmp __alltraps
  101ed6:	e9 cc ff ff ff       	jmp    101ea7 <__alltraps>

00101edb <vector2>:
.globl vector2
vector2:
  pushl $0
  101edb:	6a 00                	push   $0x0
  pushl $2
  101edd:	6a 02                	push   $0x2
  jmp __alltraps
  101edf:	e9 c3 ff ff ff       	jmp    101ea7 <__alltraps>

00101ee4 <vector3>:
.globl vector3
vector3:
  pushl $0
  101ee4:	6a 00                	push   $0x0
  pushl $3
  101ee6:	6a 03                	push   $0x3
  jmp __alltraps
  101ee8:	e9 ba ff ff ff       	jmp    101ea7 <__alltraps>

00101eed <vector4>:
.globl vector4
vector4:
  pushl $0
  101eed:	6a 00                	push   $0x0
  pushl $4
  101eef:	6a 04                	push   $0x4
  jmp __alltraps
  101ef1:	e9 b1 ff ff ff       	jmp    101ea7 <__alltraps>

00101ef6 <vector5>:
.globl vector5
vector5:
  pushl $0
  101ef6:	6a 00                	push   $0x0
  pushl $5
  101ef8:	6a 05                	push   $0x5
  jmp __alltraps
  101efa:	e9 a8 ff ff ff       	jmp    101ea7 <__alltraps>

00101eff <vector6>:
.globl vector6
vector6:
  pushl $0
  101eff:	6a 00                	push   $0x0
  pushl $6
  101f01:	6a 06                	push   $0x6
  jmp __alltraps
  101f03:	e9 9f ff ff ff       	jmp    101ea7 <__alltraps>

00101f08 <vector7>:
.globl vector7
vector7:
  pushl $0
  101f08:	6a 00                	push   $0x0
  pushl $7
  101f0a:	6a 07                	push   $0x7
  jmp __alltraps
  101f0c:	e9 96 ff ff ff       	jmp    101ea7 <__alltraps>

00101f11 <vector8>:
.globl vector8
vector8:
  pushl $8
  101f11:	6a 08                	push   $0x8
  jmp __alltraps
  101f13:	e9 8f ff ff ff       	jmp    101ea7 <__alltraps>

00101f18 <vector9>:
.globl vector9
vector9:
  pushl $0
  101f18:	6a 00                	push   $0x0
  pushl $9
  101f1a:	6a 09                	push   $0x9
  jmp __alltraps
  101f1c:	e9 86 ff ff ff       	jmp    101ea7 <__alltraps>

00101f21 <vector10>:
.globl vector10
vector10:
  pushl $10
  101f21:	6a 0a                	push   $0xa
  jmp __alltraps
  101f23:	e9 7f ff ff ff       	jmp    101ea7 <__alltraps>

00101f28 <vector11>:
.globl vector11
vector11:
  pushl $11
  101f28:	6a 0b                	push   $0xb
  jmp __alltraps
  101f2a:	e9 78 ff ff ff       	jmp    101ea7 <__alltraps>

00101f2f <vector12>:
.globl vector12
vector12:
  pushl $12
  101f2f:	6a 0c                	push   $0xc
  jmp __alltraps
  101f31:	e9 71 ff ff ff       	jmp    101ea7 <__alltraps>

00101f36 <vector13>:
.globl vector13
vector13:
  pushl $13
  101f36:	6a 0d                	push   $0xd
  jmp __alltraps
  101f38:	e9 6a ff ff ff       	jmp    101ea7 <__alltraps>

00101f3d <vector14>:
.globl vector14
vector14:
  pushl $14
  101f3d:	6a 0e                	push   $0xe
  jmp __alltraps
  101f3f:	e9 63 ff ff ff       	jmp    101ea7 <__alltraps>

00101f44 <vector15>:
.globl vector15
vector15:
  pushl $0
  101f44:	6a 00                	push   $0x0
  pushl $15
  101f46:	6a 0f                	push   $0xf
  jmp __alltraps
  101f48:	e9 5a ff ff ff       	jmp    101ea7 <__alltraps>

00101f4d <vector16>:
.globl vector16
vector16:
  pushl $0
  101f4d:	6a 00                	push   $0x0
  pushl $16
  101f4f:	6a 10                	push   $0x10
  jmp __alltraps
  101f51:	e9 51 ff ff ff       	jmp    101ea7 <__alltraps>

00101f56 <vector17>:
.globl vector17
vector17:
  pushl $17
  101f56:	6a 11                	push   $0x11
  jmp __alltraps
  101f58:	e9 4a ff ff ff       	jmp    101ea7 <__alltraps>

00101f5d <vector18>:
.globl vector18
vector18:
  pushl $0
  101f5d:	6a 00                	push   $0x0
  pushl $18
  101f5f:	6a 12                	push   $0x12
  jmp __alltraps
  101f61:	e9 41 ff ff ff       	jmp    101ea7 <__alltraps>

00101f66 <vector19>:
.globl vector19
vector19:
  pushl $0
  101f66:	6a 00                	push   $0x0
  pushl $19
  101f68:	6a 13                	push   $0x13
  jmp __alltraps
  101f6a:	e9 38 ff ff ff       	jmp    101ea7 <__alltraps>

00101f6f <vector20>:
.globl vector20
vector20:
  pushl $0
  101f6f:	6a 00                	push   $0x0
  pushl $20
  101f71:	6a 14                	push   $0x14
  jmp __alltraps
  101f73:	e9 2f ff ff ff       	jmp    101ea7 <__alltraps>

00101f78 <vector21>:
.globl vector21
vector21:
  pushl $0
  101f78:	6a 00                	push   $0x0
  pushl $21
  101f7a:	6a 15                	push   $0x15
  jmp __alltraps
  101f7c:	e9 26 ff ff ff       	jmp    101ea7 <__alltraps>

00101f81 <vector22>:
.globl vector22
vector22:
  pushl $0
  101f81:	6a 00                	push   $0x0
  pushl $22
  101f83:	6a 16                	push   $0x16
  jmp __alltraps
  101f85:	e9 1d ff ff ff       	jmp    101ea7 <__alltraps>

00101f8a <vector23>:
.globl vector23
vector23:
  pushl $0
  101f8a:	6a 00                	push   $0x0
  pushl $23
  101f8c:	6a 17                	push   $0x17
  jmp __alltraps
  101f8e:	e9 14 ff ff ff       	jmp    101ea7 <__alltraps>

00101f93 <vector24>:
.globl vector24
vector24:
  pushl $0
  101f93:	6a 00                	push   $0x0
  pushl $24
  101f95:	6a 18                	push   $0x18
  jmp __alltraps
  101f97:	e9 0b ff ff ff       	jmp    101ea7 <__alltraps>

00101f9c <vector25>:
.globl vector25
vector25:
  pushl $0
  101f9c:	6a 00                	push   $0x0
  pushl $25
  101f9e:	6a 19                	push   $0x19
  jmp __alltraps
  101fa0:	e9 02 ff ff ff       	jmp    101ea7 <__alltraps>

00101fa5 <vector26>:
.globl vector26
vector26:
  pushl $0
  101fa5:	6a 00                	push   $0x0
  pushl $26
  101fa7:	6a 1a                	push   $0x1a
  jmp __alltraps
  101fa9:	e9 f9 fe ff ff       	jmp    101ea7 <__alltraps>

00101fae <vector27>:
.globl vector27
vector27:
  pushl $0
  101fae:	6a 00                	push   $0x0
  pushl $27
  101fb0:	6a 1b                	push   $0x1b
  jmp __alltraps
  101fb2:	e9 f0 fe ff ff       	jmp    101ea7 <__alltraps>

00101fb7 <vector28>:
.globl vector28
vector28:
  pushl $0
  101fb7:	6a 00                	push   $0x0
  pushl $28
  101fb9:	6a 1c                	push   $0x1c
  jmp __alltraps
  101fbb:	e9 e7 fe ff ff       	jmp    101ea7 <__alltraps>

00101fc0 <vector29>:
.globl vector29
vector29:
  pushl $0
  101fc0:	6a 00                	push   $0x0
  pushl $29
  101fc2:	6a 1d                	push   $0x1d
  jmp __alltraps
  101fc4:	e9 de fe ff ff       	jmp    101ea7 <__alltraps>

00101fc9 <vector30>:
.globl vector30
vector30:
  pushl $0
  101fc9:	6a 00                	push   $0x0
  pushl $30
  101fcb:	6a 1e                	push   $0x1e
  jmp __alltraps
  101fcd:	e9 d5 fe ff ff       	jmp    101ea7 <__alltraps>

00101fd2 <vector31>:
.globl vector31
vector31:
  pushl $0
  101fd2:	6a 00                	push   $0x0
  pushl $31
  101fd4:	6a 1f                	push   $0x1f
  jmp __alltraps
  101fd6:	e9 cc fe ff ff       	jmp    101ea7 <__alltraps>

00101fdb <vector32>:
.globl vector32
vector32:
  pushl $0
  101fdb:	6a 00                	push   $0x0
  pushl $32
  101fdd:	6a 20                	push   $0x20
  jmp __alltraps
  101fdf:	e9 c3 fe ff ff       	jmp    101ea7 <__alltraps>

00101fe4 <vector33>:
.globl vector33
vector33:
  pushl $0
  101fe4:	6a 00                	push   $0x0
  pushl $33
  101fe6:	6a 21                	push   $0x21
  jmp __alltraps
  101fe8:	e9 ba fe ff ff       	jmp    101ea7 <__alltraps>

00101fed <vector34>:
.globl vector34
vector34:
  pushl $0
  101fed:	6a 00                	push   $0x0
  pushl $34
  101fef:	6a 22                	push   $0x22
  jmp __alltraps
  101ff1:	e9 b1 fe ff ff       	jmp    101ea7 <__alltraps>

00101ff6 <vector35>:
.globl vector35
vector35:
  pushl $0
  101ff6:	6a 00                	push   $0x0
  pushl $35
  101ff8:	6a 23                	push   $0x23
  jmp __alltraps
  101ffa:	e9 a8 fe ff ff       	jmp    101ea7 <__alltraps>

00101fff <vector36>:
.globl vector36
vector36:
  pushl $0
  101fff:	6a 00                	push   $0x0
  pushl $36
  102001:	6a 24                	push   $0x24
  jmp __alltraps
  102003:	e9 9f fe ff ff       	jmp    101ea7 <__alltraps>

00102008 <vector37>:
.globl vector37
vector37:
  pushl $0
  102008:	6a 00                	push   $0x0
  pushl $37
  10200a:	6a 25                	push   $0x25
  jmp __alltraps
  10200c:	e9 96 fe ff ff       	jmp    101ea7 <__alltraps>

00102011 <vector38>:
.globl vector38
vector38:
  pushl $0
  102011:	6a 00                	push   $0x0
  pushl $38
  102013:	6a 26                	push   $0x26
  jmp __alltraps
  102015:	e9 8d fe ff ff       	jmp    101ea7 <__alltraps>

0010201a <vector39>:
.globl vector39
vector39:
  pushl $0
  10201a:	6a 00                	push   $0x0
  pushl $39
  10201c:	6a 27                	push   $0x27
  jmp __alltraps
  10201e:	e9 84 fe ff ff       	jmp    101ea7 <__alltraps>

00102023 <vector40>:
.globl vector40
vector40:
  pushl $0
  102023:	6a 00                	push   $0x0
  pushl $40
  102025:	6a 28                	push   $0x28
  jmp __alltraps
  102027:	e9 7b fe ff ff       	jmp    101ea7 <__alltraps>

0010202c <vector41>:
.globl vector41
vector41:
  pushl $0
  10202c:	6a 00                	push   $0x0
  pushl $41
  10202e:	6a 29                	push   $0x29
  jmp __alltraps
  102030:	e9 72 fe ff ff       	jmp    101ea7 <__alltraps>

00102035 <vector42>:
.globl vector42
vector42:
  pushl $0
  102035:	6a 00                	push   $0x0
  pushl $42
  102037:	6a 2a                	push   $0x2a
  jmp __alltraps
  102039:	e9 69 fe ff ff       	jmp    101ea7 <__alltraps>

0010203e <vector43>:
.globl vector43
vector43:
  pushl $0
  10203e:	6a 00                	push   $0x0
  pushl $43
  102040:	6a 2b                	push   $0x2b
  jmp __alltraps
  102042:	e9 60 fe ff ff       	jmp    101ea7 <__alltraps>

00102047 <vector44>:
.globl vector44
vector44:
  pushl $0
  102047:	6a 00                	push   $0x0
  pushl $44
  102049:	6a 2c                	push   $0x2c
  jmp __alltraps
  10204b:	e9 57 fe ff ff       	jmp    101ea7 <__alltraps>

00102050 <vector45>:
.globl vector45
vector45:
  pushl $0
  102050:	6a 00                	push   $0x0
  pushl $45
  102052:	6a 2d                	push   $0x2d
  jmp __alltraps
  102054:	e9 4e fe ff ff       	jmp    101ea7 <__alltraps>

00102059 <vector46>:
.globl vector46
vector46:
  pushl $0
  102059:	6a 00                	push   $0x0
  pushl $46
  10205b:	6a 2e                	push   $0x2e
  jmp __alltraps
  10205d:	e9 45 fe ff ff       	jmp    101ea7 <__alltraps>

00102062 <vector47>:
.globl vector47
vector47:
  pushl $0
  102062:	6a 00                	push   $0x0
  pushl $47
  102064:	6a 2f                	push   $0x2f
  jmp __alltraps
  102066:	e9 3c fe ff ff       	jmp    101ea7 <__alltraps>

0010206b <vector48>:
.globl vector48
vector48:
  pushl $0
  10206b:	6a 00                	push   $0x0
  pushl $48
  10206d:	6a 30                	push   $0x30
  jmp __alltraps
  10206f:	e9 33 fe ff ff       	jmp    101ea7 <__alltraps>

00102074 <vector49>:
.globl vector49
vector49:
  pushl $0
  102074:	6a 00                	push   $0x0
  pushl $49
  102076:	6a 31                	push   $0x31
  jmp __alltraps
  102078:	e9 2a fe ff ff       	jmp    101ea7 <__alltraps>

0010207d <vector50>:
.globl vector50
vector50:
  pushl $0
  10207d:	6a 00                	push   $0x0
  pushl $50
  10207f:	6a 32                	push   $0x32
  jmp __alltraps
  102081:	e9 21 fe ff ff       	jmp    101ea7 <__alltraps>

00102086 <vector51>:
.globl vector51
vector51:
  pushl $0
  102086:	6a 00                	push   $0x0
  pushl $51
  102088:	6a 33                	push   $0x33
  jmp __alltraps
  10208a:	e9 18 fe ff ff       	jmp    101ea7 <__alltraps>

0010208f <vector52>:
.globl vector52
vector52:
  pushl $0
  10208f:	6a 00                	push   $0x0
  pushl $52
  102091:	6a 34                	push   $0x34
  jmp __alltraps
  102093:	e9 0f fe ff ff       	jmp    101ea7 <__alltraps>

00102098 <vector53>:
.globl vector53
vector53:
  pushl $0
  102098:	6a 00                	push   $0x0
  pushl $53
  10209a:	6a 35                	push   $0x35
  jmp __alltraps
  10209c:	e9 06 fe ff ff       	jmp    101ea7 <__alltraps>

001020a1 <vector54>:
.globl vector54
vector54:
  pushl $0
  1020a1:	6a 00                	push   $0x0
  pushl $54
  1020a3:	6a 36                	push   $0x36
  jmp __alltraps
  1020a5:	e9 fd fd ff ff       	jmp    101ea7 <__alltraps>

001020aa <vector55>:
.globl vector55
vector55:
  pushl $0
  1020aa:	6a 00                	push   $0x0
  pushl $55
  1020ac:	6a 37                	push   $0x37
  jmp __alltraps
  1020ae:	e9 f4 fd ff ff       	jmp    101ea7 <__alltraps>

001020b3 <vector56>:
.globl vector56
vector56:
  pushl $0
  1020b3:	6a 00                	push   $0x0
  pushl $56
  1020b5:	6a 38                	push   $0x38
  jmp __alltraps
  1020b7:	e9 eb fd ff ff       	jmp    101ea7 <__alltraps>

001020bc <vector57>:
.globl vector57
vector57:
  pushl $0
  1020bc:	6a 00                	push   $0x0
  pushl $57
  1020be:	6a 39                	push   $0x39
  jmp __alltraps
  1020c0:	e9 e2 fd ff ff       	jmp    101ea7 <__alltraps>

001020c5 <vector58>:
.globl vector58
vector58:
  pushl $0
  1020c5:	6a 00                	push   $0x0
  pushl $58
  1020c7:	6a 3a                	push   $0x3a
  jmp __alltraps
  1020c9:	e9 d9 fd ff ff       	jmp    101ea7 <__alltraps>

001020ce <vector59>:
.globl vector59
vector59:
  pushl $0
  1020ce:	6a 00                	push   $0x0
  pushl $59
  1020d0:	6a 3b                	push   $0x3b
  jmp __alltraps
  1020d2:	e9 d0 fd ff ff       	jmp    101ea7 <__alltraps>

001020d7 <vector60>:
.globl vector60
vector60:
  pushl $0
  1020d7:	6a 00                	push   $0x0
  pushl $60
  1020d9:	6a 3c                	push   $0x3c
  jmp __alltraps
  1020db:	e9 c7 fd ff ff       	jmp    101ea7 <__alltraps>

001020e0 <vector61>:
.globl vector61
vector61:
  pushl $0
  1020e0:	6a 00                	push   $0x0
  pushl $61
  1020e2:	6a 3d                	push   $0x3d
  jmp __alltraps
  1020e4:	e9 be fd ff ff       	jmp    101ea7 <__alltraps>

001020e9 <vector62>:
.globl vector62
vector62:
  pushl $0
  1020e9:	6a 00                	push   $0x0
  pushl $62
  1020eb:	6a 3e                	push   $0x3e
  jmp __alltraps
  1020ed:	e9 b5 fd ff ff       	jmp    101ea7 <__alltraps>

001020f2 <vector63>:
.globl vector63
vector63:
  pushl $0
  1020f2:	6a 00                	push   $0x0
  pushl $63
  1020f4:	6a 3f                	push   $0x3f
  jmp __alltraps
  1020f6:	e9 ac fd ff ff       	jmp    101ea7 <__alltraps>

001020fb <vector64>:
.globl vector64
vector64:
  pushl $0
  1020fb:	6a 00                	push   $0x0
  pushl $64
  1020fd:	6a 40                	push   $0x40
  jmp __alltraps
  1020ff:	e9 a3 fd ff ff       	jmp    101ea7 <__alltraps>

00102104 <vector65>:
.globl vector65
vector65:
  pushl $0
  102104:	6a 00                	push   $0x0
  pushl $65
  102106:	6a 41                	push   $0x41
  jmp __alltraps
  102108:	e9 9a fd ff ff       	jmp    101ea7 <__alltraps>

0010210d <vector66>:
.globl vector66
vector66:
  pushl $0
  10210d:	6a 00                	push   $0x0
  pushl $66
  10210f:	6a 42                	push   $0x42
  jmp __alltraps
  102111:	e9 91 fd ff ff       	jmp    101ea7 <__alltraps>

00102116 <vector67>:
.globl vector67
vector67:
  pushl $0
  102116:	6a 00                	push   $0x0
  pushl $67
  102118:	6a 43                	push   $0x43
  jmp __alltraps
  10211a:	e9 88 fd ff ff       	jmp    101ea7 <__alltraps>

0010211f <vector68>:
.globl vector68
vector68:
  pushl $0
  10211f:	6a 00                	push   $0x0
  pushl $68
  102121:	6a 44                	push   $0x44
  jmp __alltraps
  102123:	e9 7f fd ff ff       	jmp    101ea7 <__alltraps>

00102128 <vector69>:
.globl vector69
vector69:
  pushl $0
  102128:	6a 00                	push   $0x0
  pushl $69
  10212a:	6a 45                	push   $0x45
  jmp __alltraps
  10212c:	e9 76 fd ff ff       	jmp    101ea7 <__alltraps>

00102131 <vector70>:
.globl vector70
vector70:
  pushl $0
  102131:	6a 00                	push   $0x0
  pushl $70
  102133:	6a 46                	push   $0x46
  jmp __alltraps
  102135:	e9 6d fd ff ff       	jmp    101ea7 <__alltraps>

0010213a <vector71>:
.globl vector71
vector71:
  pushl $0
  10213a:	6a 00                	push   $0x0
  pushl $71
  10213c:	6a 47                	push   $0x47
  jmp __alltraps
  10213e:	e9 64 fd ff ff       	jmp    101ea7 <__alltraps>

00102143 <vector72>:
.globl vector72
vector72:
  pushl $0
  102143:	6a 00                	push   $0x0
  pushl $72
  102145:	6a 48                	push   $0x48
  jmp __alltraps
  102147:	e9 5b fd ff ff       	jmp    101ea7 <__alltraps>

0010214c <vector73>:
.globl vector73
vector73:
  pushl $0
  10214c:	6a 00                	push   $0x0
  pushl $73
  10214e:	6a 49                	push   $0x49
  jmp __alltraps
  102150:	e9 52 fd ff ff       	jmp    101ea7 <__alltraps>

00102155 <vector74>:
.globl vector74
vector74:
  pushl $0
  102155:	6a 00                	push   $0x0
  pushl $74
  102157:	6a 4a                	push   $0x4a
  jmp __alltraps
  102159:	e9 49 fd ff ff       	jmp    101ea7 <__alltraps>

0010215e <vector75>:
.globl vector75
vector75:
  pushl $0
  10215e:	6a 00                	push   $0x0
  pushl $75
  102160:	6a 4b                	push   $0x4b
  jmp __alltraps
  102162:	e9 40 fd ff ff       	jmp    101ea7 <__alltraps>

00102167 <vector76>:
.globl vector76
vector76:
  pushl $0
  102167:	6a 00                	push   $0x0
  pushl $76
  102169:	6a 4c                	push   $0x4c
  jmp __alltraps
  10216b:	e9 37 fd ff ff       	jmp    101ea7 <__alltraps>

00102170 <vector77>:
.globl vector77
vector77:
  pushl $0
  102170:	6a 00                	push   $0x0
  pushl $77
  102172:	6a 4d                	push   $0x4d
  jmp __alltraps
  102174:	e9 2e fd ff ff       	jmp    101ea7 <__alltraps>

00102179 <vector78>:
.globl vector78
vector78:
  pushl $0
  102179:	6a 00                	push   $0x0
  pushl $78
  10217b:	6a 4e                	push   $0x4e
  jmp __alltraps
  10217d:	e9 25 fd ff ff       	jmp    101ea7 <__alltraps>

00102182 <vector79>:
.globl vector79
vector79:
  pushl $0
  102182:	6a 00                	push   $0x0
  pushl $79
  102184:	6a 4f                	push   $0x4f
  jmp __alltraps
  102186:	e9 1c fd ff ff       	jmp    101ea7 <__alltraps>

0010218b <vector80>:
.globl vector80
vector80:
  pushl $0
  10218b:	6a 00                	push   $0x0
  pushl $80
  10218d:	6a 50                	push   $0x50
  jmp __alltraps
  10218f:	e9 13 fd ff ff       	jmp    101ea7 <__alltraps>

00102194 <vector81>:
.globl vector81
vector81:
  pushl $0
  102194:	6a 00                	push   $0x0
  pushl $81
  102196:	6a 51                	push   $0x51
  jmp __alltraps
  102198:	e9 0a fd ff ff       	jmp    101ea7 <__alltraps>

0010219d <vector82>:
.globl vector82
vector82:
  pushl $0
  10219d:	6a 00                	push   $0x0
  pushl $82
  10219f:	6a 52                	push   $0x52
  jmp __alltraps
  1021a1:	e9 01 fd ff ff       	jmp    101ea7 <__alltraps>

001021a6 <vector83>:
.globl vector83
vector83:
  pushl $0
  1021a6:	6a 00                	push   $0x0
  pushl $83
  1021a8:	6a 53                	push   $0x53
  jmp __alltraps
  1021aa:	e9 f8 fc ff ff       	jmp    101ea7 <__alltraps>

001021af <vector84>:
.globl vector84
vector84:
  pushl $0
  1021af:	6a 00                	push   $0x0
  pushl $84
  1021b1:	6a 54                	push   $0x54
  jmp __alltraps
  1021b3:	e9 ef fc ff ff       	jmp    101ea7 <__alltraps>

001021b8 <vector85>:
.globl vector85
vector85:
  pushl $0
  1021b8:	6a 00                	push   $0x0
  pushl $85
  1021ba:	6a 55                	push   $0x55
  jmp __alltraps
  1021bc:	e9 e6 fc ff ff       	jmp    101ea7 <__alltraps>

001021c1 <vector86>:
.globl vector86
vector86:
  pushl $0
  1021c1:	6a 00                	push   $0x0
  pushl $86
  1021c3:	6a 56                	push   $0x56
  jmp __alltraps
  1021c5:	e9 dd fc ff ff       	jmp    101ea7 <__alltraps>

001021ca <vector87>:
.globl vector87
vector87:
  pushl $0
  1021ca:	6a 00                	push   $0x0
  pushl $87
  1021cc:	6a 57                	push   $0x57
  jmp __alltraps
  1021ce:	e9 d4 fc ff ff       	jmp    101ea7 <__alltraps>

001021d3 <vector88>:
.globl vector88
vector88:
  pushl $0
  1021d3:	6a 00                	push   $0x0
  pushl $88
  1021d5:	6a 58                	push   $0x58
  jmp __alltraps
  1021d7:	e9 cb fc ff ff       	jmp    101ea7 <__alltraps>

001021dc <vector89>:
.globl vector89
vector89:
  pushl $0
  1021dc:	6a 00                	push   $0x0
  pushl $89
  1021de:	6a 59                	push   $0x59
  jmp __alltraps
  1021e0:	e9 c2 fc ff ff       	jmp    101ea7 <__alltraps>

001021e5 <vector90>:
.globl vector90
vector90:
  pushl $0
  1021e5:	6a 00                	push   $0x0
  pushl $90
  1021e7:	6a 5a                	push   $0x5a
  jmp __alltraps
  1021e9:	e9 b9 fc ff ff       	jmp    101ea7 <__alltraps>

001021ee <vector91>:
.globl vector91
vector91:
  pushl $0
  1021ee:	6a 00                	push   $0x0
  pushl $91
  1021f0:	6a 5b                	push   $0x5b
  jmp __alltraps
  1021f2:	e9 b0 fc ff ff       	jmp    101ea7 <__alltraps>

001021f7 <vector92>:
.globl vector92
vector92:
  pushl $0
  1021f7:	6a 00                	push   $0x0
  pushl $92
  1021f9:	6a 5c                	push   $0x5c
  jmp __alltraps
  1021fb:	e9 a7 fc ff ff       	jmp    101ea7 <__alltraps>

00102200 <vector93>:
.globl vector93
vector93:
  pushl $0
  102200:	6a 00                	push   $0x0
  pushl $93
  102202:	6a 5d                	push   $0x5d
  jmp __alltraps
  102204:	e9 9e fc ff ff       	jmp    101ea7 <__alltraps>

00102209 <vector94>:
.globl vector94
vector94:
  pushl $0
  102209:	6a 00                	push   $0x0
  pushl $94
  10220b:	6a 5e                	push   $0x5e
  jmp __alltraps
  10220d:	e9 95 fc ff ff       	jmp    101ea7 <__alltraps>

00102212 <vector95>:
.globl vector95
vector95:
  pushl $0
  102212:	6a 00                	push   $0x0
  pushl $95
  102214:	6a 5f                	push   $0x5f
  jmp __alltraps
  102216:	e9 8c fc ff ff       	jmp    101ea7 <__alltraps>

0010221b <vector96>:
.globl vector96
vector96:
  pushl $0
  10221b:	6a 00                	push   $0x0
  pushl $96
  10221d:	6a 60                	push   $0x60
  jmp __alltraps
  10221f:	e9 83 fc ff ff       	jmp    101ea7 <__alltraps>

00102224 <vector97>:
.globl vector97
vector97:
  pushl $0
  102224:	6a 00                	push   $0x0
  pushl $97
  102226:	6a 61                	push   $0x61
  jmp __alltraps
  102228:	e9 7a fc ff ff       	jmp    101ea7 <__alltraps>

0010222d <vector98>:
.globl vector98
vector98:
  pushl $0
  10222d:	6a 00                	push   $0x0
  pushl $98
  10222f:	6a 62                	push   $0x62
  jmp __alltraps
  102231:	e9 71 fc ff ff       	jmp    101ea7 <__alltraps>

00102236 <vector99>:
.globl vector99
vector99:
  pushl $0
  102236:	6a 00                	push   $0x0
  pushl $99
  102238:	6a 63                	push   $0x63
  jmp __alltraps
  10223a:	e9 68 fc ff ff       	jmp    101ea7 <__alltraps>

0010223f <vector100>:
.globl vector100
vector100:
  pushl $0
  10223f:	6a 00                	push   $0x0
  pushl $100
  102241:	6a 64                	push   $0x64
  jmp __alltraps
  102243:	e9 5f fc ff ff       	jmp    101ea7 <__alltraps>

00102248 <vector101>:
.globl vector101
vector101:
  pushl $0
  102248:	6a 00                	push   $0x0
  pushl $101
  10224a:	6a 65                	push   $0x65
  jmp __alltraps
  10224c:	e9 56 fc ff ff       	jmp    101ea7 <__alltraps>

00102251 <vector102>:
.globl vector102
vector102:
  pushl $0
  102251:	6a 00                	push   $0x0
  pushl $102
  102253:	6a 66                	push   $0x66
  jmp __alltraps
  102255:	e9 4d fc ff ff       	jmp    101ea7 <__alltraps>

0010225a <vector103>:
.globl vector103
vector103:
  pushl $0
  10225a:	6a 00                	push   $0x0
  pushl $103
  10225c:	6a 67                	push   $0x67
  jmp __alltraps
  10225e:	e9 44 fc ff ff       	jmp    101ea7 <__alltraps>

00102263 <vector104>:
.globl vector104
vector104:
  pushl $0
  102263:	6a 00                	push   $0x0
  pushl $104
  102265:	6a 68                	push   $0x68
  jmp __alltraps
  102267:	e9 3b fc ff ff       	jmp    101ea7 <__alltraps>

0010226c <vector105>:
.globl vector105
vector105:
  pushl $0
  10226c:	6a 00                	push   $0x0
  pushl $105
  10226e:	6a 69                	push   $0x69
  jmp __alltraps
  102270:	e9 32 fc ff ff       	jmp    101ea7 <__alltraps>

00102275 <vector106>:
.globl vector106
vector106:
  pushl $0
  102275:	6a 00                	push   $0x0
  pushl $106
  102277:	6a 6a                	push   $0x6a
  jmp __alltraps
  102279:	e9 29 fc ff ff       	jmp    101ea7 <__alltraps>

0010227e <vector107>:
.globl vector107
vector107:
  pushl $0
  10227e:	6a 00                	push   $0x0
  pushl $107
  102280:	6a 6b                	push   $0x6b
  jmp __alltraps
  102282:	e9 20 fc ff ff       	jmp    101ea7 <__alltraps>

00102287 <vector108>:
.globl vector108
vector108:
  pushl $0
  102287:	6a 00                	push   $0x0
  pushl $108
  102289:	6a 6c                	push   $0x6c
  jmp __alltraps
  10228b:	e9 17 fc ff ff       	jmp    101ea7 <__alltraps>

00102290 <vector109>:
.globl vector109
vector109:
  pushl $0
  102290:	6a 00                	push   $0x0
  pushl $109
  102292:	6a 6d                	push   $0x6d
  jmp __alltraps
  102294:	e9 0e fc ff ff       	jmp    101ea7 <__alltraps>

00102299 <vector110>:
.globl vector110
vector110:
  pushl $0
  102299:	6a 00                	push   $0x0
  pushl $110
  10229b:	6a 6e                	push   $0x6e
  jmp __alltraps
  10229d:	e9 05 fc ff ff       	jmp    101ea7 <__alltraps>

001022a2 <vector111>:
.globl vector111
vector111:
  pushl $0
  1022a2:	6a 00                	push   $0x0
  pushl $111
  1022a4:	6a 6f                	push   $0x6f
  jmp __alltraps
  1022a6:	e9 fc fb ff ff       	jmp    101ea7 <__alltraps>

001022ab <vector112>:
.globl vector112
vector112:
  pushl $0
  1022ab:	6a 00                	push   $0x0
  pushl $112
  1022ad:	6a 70                	push   $0x70
  jmp __alltraps
  1022af:	e9 f3 fb ff ff       	jmp    101ea7 <__alltraps>

001022b4 <vector113>:
.globl vector113
vector113:
  pushl $0
  1022b4:	6a 00                	push   $0x0
  pushl $113
  1022b6:	6a 71                	push   $0x71
  jmp __alltraps
  1022b8:	e9 ea fb ff ff       	jmp    101ea7 <__alltraps>

001022bd <vector114>:
.globl vector114
vector114:
  pushl $0
  1022bd:	6a 00                	push   $0x0
  pushl $114
  1022bf:	6a 72                	push   $0x72
  jmp __alltraps
  1022c1:	e9 e1 fb ff ff       	jmp    101ea7 <__alltraps>

001022c6 <vector115>:
.globl vector115
vector115:
  pushl $0
  1022c6:	6a 00                	push   $0x0
  pushl $115
  1022c8:	6a 73                	push   $0x73
  jmp __alltraps
  1022ca:	e9 d8 fb ff ff       	jmp    101ea7 <__alltraps>

001022cf <vector116>:
.globl vector116
vector116:
  pushl $0
  1022cf:	6a 00                	push   $0x0
  pushl $116
  1022d1:	6a 74                	push   $0x74
  jmp __alltraps
  1022d3:	e9 cf fb ff ff       	jmp    101ea7 <__alltraps>

001022d8 <vector117>:
.globl vector117
vector117:
  pushl $0
  1022d8:	6a 00                	push   $0x0
  pushl $117
  1022da:	6a 75                	push   $0x75
  jmp __alltraps
  1022dc:	e9 c6 fb ff ff       	jmp    101ea7 <__alltraps>

001022e1 <vector118>:
.globl vector118
vector118:
  pushl $0
  1022e1:	6a 00                	push   $0x0
  pushl $118
  1022e3:	6a 76                	push   $0x76
  jmp __alltraps
  1022e5:	e9 bd fb ff ff       	jmp    101ea7 <__alltraps>

001022ea <vector119>:
.globl vector119
vector119:
  pushl $0
  1022ea:	6a 00                	push   $0x0
  pushl $119
  1022ec:	6a 77                	push   $0x77
  jmp __alltraps
  1022ee:	e9 b4 fb ff ff       	jmp    101ea7 <__alltraps>

001022f3 <vector120>:
.globl vector120
vector120:
  pushl $0
  1022f3:	6a 00                	push   $0x0
  pushl $120
  1022f5:	6a 78                	push   $0x78
  jmp __alltraps
  1022f7:	e9 ab fb ff ff       	jmp    101ea7 <__alltraps>

001022fc <vector121>:
.globl vector121
vector121:
  pushl $0
  1022fc:	6a 00                	push   $0x0
  pushl $121
  1022fe:	6a 79                	push   $0x79
  jmp __alltraps
  102300:	e9 a2 fb ff ff       	jmp    101ea7 <__alltraps>

00102305 <vector122>:
.globl vector122
vector122:
  pushl $0
  102305:	6a 00                	push   $0x0
  pushl $122
  102307:	6a 7a                	push   $0x7a
  jmp __alltraps
  102309:	e9 99 fb ff ff       	jmp    101ea7 <__alltraps>

0010230e <vector123>:
.globl vector123
vector123:
  pushl $0
  10230e:	6a 00                	push   $0x0
  pushl $123
  102310:	6a 7b                	push   $0x7b
  jmp __alltraps
  102312:	e9 90 fb ff ff       	jmp    101ea7 <__alltraps>

00102317 <vector124>:
.globl vector124
vector124:
  pushl $0
  102317:	6a 00                	push   $0x0
  pushl $124
  102319:	6a 7c                	push   $0x7c
  jmp __alltraps
  10231b:	e9 87 fb ff ff       	jmp    101ea7 <__alltraps>

00102320 <vector125>:
.globl vector125
vector125:
  pushl $0
  102320:	6a 00                	push   $0x0
  pushl $125
  102322:	6a 7d                	push   $0x7d
  jmp __alltraps
  102324:	e9 7e fb ff ff       	jmp    101ea7 <__alltraps>

00102329 <vector126>:
.globl vector126
vector126:
  pushl $0
  102329:	6a 00                	push   $0x0
  pushl $126
  10232b:	6a 7e                	push   $0x7e
  jmp __alltraps
  10232d:	e9 75 fb ff ff       	jmp    101ea7 <__alltraps>

00102332 <vector127>:
.globl vector127
vector127:
  pushl $0
  102332:	6a 00                	push   $0x0
  pushl $127
  102334:	6a 7f                	push   $0x7f
  jmp __alltraps
  102336:	e9 6c fb ff ff       	jmp    101ea7 <__alltraps>

0010233b <vector128>:
.globl vector128
vector128:
  pushl $0
  10233b:	6a 00                	push   $0x0
  pushl $128
  10233d:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102342:	e9 60 fb ff ff       	jmp    101ea7 <__alltraps>

00102347 <vector129>:
.globl vector129
vector129:
  pushl $0
  102347:	6a 00                	push   $0x0
  pushl $129
  102349:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  10234e:	e9 54 fb ff ff       	jmp    101ea7 <__alltraps>

00102353 <vector130>:
.globl vector130
vector130:
  pushl $0
  102353:	6a 00                	push   $0x0
  pushl $130
  102355:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  10235a:	e9 48 fb ff ff       	jmp    101ea7 <__alltraps>

0010235f <vector131>:
.globl vector131
vector131:
  pushl $0
  10235f:	6a 00                	push   $0x0
  pushl $131
  102361:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102366:	e9 3c fb ff ff       	jmp    101ea7 <__alltraps>

0010236b <vector132>:
.globl vector132
vector132:
  pushl $0
  10236b:	6a 00                	push   $0x0
  pushl $132
  10236d:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102372:	e9 30 fb ff ff       	jmp    101ea7 <__alltraps>

00102377 <vector133>:
.globl vector133
vector133:
  pushl $0
  102377:	6a 00                	push   $0x0
  pushl $133
  102379:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  10237e:	e9 24 fb ff ff       	jmp    101ea7 <__alltraps>

00102383 <vector134>:
.globl vector134
vector134:
  pushl $0
  102383:	6a 00                	push   $0x0
  pushl $134
  102385:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  10238a:	e9 18 fb ff ff       	jmp    101ea7 <__alltraps>

0010238f <vector135>:
.globl vector135
vector135:
  pushl $0
  10238f:	6a 00                	push   $0x0
  pushl $135
  102391:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102396:	e9 0c fb ff ff       	jmp    101ea7 <__alltraps>

0010239b <vector136>:
.globl vector136
vector136:
  pushl $0
  10239b:	6a 00                	push   $0x0
  pushl $136
  10239d:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  1023a2:	e9 00 fb ff ff       	jmp    101ea7 <__alltraps>

001023a7 <vector137>:
.globl vector137
vector137:
  pushl $0
  1023a7:	6a 00                	push   $0x0
  pushl $137
  1023a9:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1023ae:	e9 f4 fa ff ff       	jmp    101ea7 <__alltraps>

001023b3 <vector138>:
.globl vector138
vector138:
  pushl $0
  1023b3:	6a 00                	push   $0x0
  pushl $138
  1023b5:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1023ba:	e9 e8 fa ff ff       	jmp    101ea7 <__alltraps>

001023bf <vector139>:
.globl vector139
vector139:
  pushl $0
  1023bf:	6a 00                	push   $0x0
  pushl $139
  1023c1:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1023c6:	e9 dc fa ff ff       	jmp    101ea7 <__alltraps>

001023cb <vector140>:
.globl vector140
vector140:
  pushl $0
  1023cb:	6a 00                	push   $0x0
  pushl $140
  1023cd:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1023d2:	e9 d0 fa ff ff       	jmp    101ea7 <__alltraps>

001023d7 <vector141>:
.globl vector141
vector141:
  pushl $0
  1023d7:	6a 00                	push   $0x0
  pushl $141
  1023d9:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1023de:	e9 c4 fa ff ff       	jmp    101ea7 <__alltraps>

001023e3 <vector142>:
.globl vector142
vector142:
  pushl $0
  1023e3:	6a 00                	push   $0x0
  pushl $142
  1023e5:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1023ea:	e9 b8 fa ff ff       	jmp    101ea7 <__alltraps>

001023ef <vector143>:
.globl vector143
vector143:
  pushl $0
  1023ef:	6a 00                	push   $0x0
  pushl $143
  1023f1:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1023f6:	e9 ac fa ff ff       	jmp    101ea7 <__alltraps>

001023fb <vector144>:
.globl vector144
vector144:
  pushl $0
  1023fb:	6a 00                	push   $0x0
  pushl $144
  1023fd:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  102402:	e9 a0 fa ff ff       	jmp    101ea7 <__alltraps>

00102407 <vector145>:
.globl vector145
vector145:
  pushl $0
  102407:	6a 00                	push   $0x0
  pushl $145
  102409:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  10240e:	e9 94 fa ff ff       	jmp    101ea7 <__alltraps>

00102413 <vector146>:
.globl vector146
vector146:
  pushl $0
  102413:	6a 00                	push   $0x0
  pushl $146
  102415:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  10241a:	e9 88 fa ff ff       	jmp    101ea7 <__alltraps>

0010241f <vector147>:
.globl vector147
vector147:
  pushl $0
  10241f:	6a 00                	push   $0x0
  pushl $147
  102421:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102426:	e9 7c fa ff ff       	jmp    101ea7 <__alltraps>

0010242b <vector148>:
.globl vector148
vector148:
  pushl $0
  10242b:	6a 00                	push   $0x0
  pushl $148
  10242d:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102432:	e9 70 fa ff ff       	jmp    101ea7 <__alltraps>

00102437 <vector149>:
.globl vector149
vector149:
  pushl $0
  102437:	6a 00                	push   $0x0
  pushl $149
  102439:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  10243e:	e9 64 fa ff ff       	jmp    101ea7 <__alltraps>

00102443 <vector150>:
.globl vector150
vector150:
  pushl $0
  102443:	6a 00                	push   $0x0
  pushl $150
  102445:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  10244a:	e9 58 fa ff ff       	jmp    101ea7 <__alltraps>

0010244f <vector151>:
.globl vector151
vector151:
  pushl $0
  10244f:	6a 00                	push   $0x0
  pushl $151
  102451:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102456:	e9 4c fa ff ff       	jmp    101ea7 <__alltraps>

0010245b <vector152>:
.globl vector152
vector152:
  pushl $0
  10245b:	6a 00                	push   $0x0
  pushl $152
  10245d:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102462:	e9 40 fa ff ff       	jmp    101ea7 <__alltraps>

00102467 <vector153>:
.globl vector153
vector153:
  pushl $0
  102467:	6a 00                	push   $0x0
  pushl $153
  102469:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  10246e:	e9 34 fa ff ff       	jmp    101ea7 <__alltraps>

00102473 <vector154>:
.globl vector154
vector154:
  pushl $0
  102473:	6a 00                	push   $0x0
  pushl $154
  102475:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  10247a:	e9 28 fa ff ff       	jmp    101ea7 <__alltraps>

0010247f <vector155>:
.globl vector155
vector155:
  pushl $0
  10247f:	6a 00                	push   $0x0
  pushl $155
  102481:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102486:	e9 1c fa ff ff       	jmp    101ea7 <__alltraps>

0010248b <vector156>:
.globl vector156
vector156:
  pushl $0
  10248b:	6a 00                	push   $0x0
  pushl $156
  10248d:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  102492:	e9 10 fa ff ff       	jmp    101ea7 <__alltraps>

00102497 <vector157>:
.globl vector157
vector157:
  pushl $0
  102497:	6a 00                	push   $0x0
  pushl $157
  102499:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  10249e:	e9 04 fa ff ff       	jmp    101ea7 <__alltraps>

001024a3 <vector158>:
.globl vector158
vector158:
  pushl $0
  1024a3:	6a 00                	push   $0x0
  pushl $158
  1024a5:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1024aa:	e9 f8 f9 ff ff       	jmp    101ea7 <__alltraps>

001024af <vector159>:
.globl vector159
vector159:
  pushl $0
  1024af:	6a 00                	push   $0x0
  pushl $159
  1024b1:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1024b6:	e9 ec f9 ff ff       	jmp    101ea7 <__alltraps>

001024bb <vector160>:
.globl vector160
vector160:
  pushl $0
  1024bb:	6a 00                	push   $0x0
  pushl $160
  1024bd:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1024c2:	e9 e0 f9 ff ff       	jmp    101ea7 <__alltraps>

001024c7 <vector161>:
.globl vector161
vector161:
  pushl $0
  1024c7:	6a 00                	push   $0x0
  pushl $161
  1024c9:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1024ce:	e9 d4 f9 ff ff       	jmp    101ea7 <__alltraps>

001024d3 <vector162>:
.globl vector162
vector162:
  pushl $0
  1024d3:	6a 00                	push   $0x0
  pushl $162
  1024d5:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1024da:	e9 c8 f9 ff ff       	jmp    101ea7 <__alltraps>

001024df <vector163>:
.globl vector163
vector163:
  pushl $0
  1024df:	6a 00                	push   $0x0
  pushl $163
  1024e1:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1024e6:	e9 bc f9 ff ff       	jmp    101ea7 <__alltraps>

001024eb <vector164>:
.globl vector164
vector164:
  pushl $0
  1024eb:	6a 00                	push   $0x0
  pushl $164
  1024ed:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1024f2:	e9 b0 f9 ff ff       	jmp    101ea7 <__alltraps>

001024f7 <vector165>:
.globl vector165
vector165:
  pushl $0
  1024f7:	6a 00                	push   $0x0
  pushl $165
  1024f9:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1024fe:	e9 a4 f9 ff ff       	jmp    101ea7 <__alltraps>

00102503 <vector166>:
.globl vector166
vector166:
  pushl $0
  102503:	6a 00                	push   $0x0
  pushl $166
  102505:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  10250a:	e9 98 f9 ff ff       	jmp    101ea7 <__alltraps>

0010250f <vector167>:
.globl vector167
vector167:
  pushl $0
  10250f:	6a 00                	push   $0x0
  pushl $167
  102511:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102516:	e9 8c f9 ff ff       	jmp    101ea7 <__alltraps>

0010251b <vector168>:
.globl vector168
vector168:
  pushl $0
  10251b:	6a 00                	push   $0x0
  pushl $168
  10251d:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102522:	e9 80 f9 ff ff       	jmp    101ea7 <__alltraps>

00102527 <vector169>:
.globl vector169
vector169:
  pushl $0
  102527:	6a 00                	push   $0x0
  pushl $169
  102529:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  10252e:	e9 74 f9 ff ff       	jmp    101ea7 <__alltraps>

00102533 <vector170>:
.globl vector170
vector170:
  pushl $0
  102533:	6a 00                	push   $0x0
  pushl $170
  102535:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  10253a:	e9 68 f9 ff ff       	jmp    101ea7 <__alltraps>

0010253f <vector171>:
.globl vector171
vector171:
  pushl $0
  10253f:	6a 00                	push   $0x0
  pushl $171
  102541:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102546:	e9 5c f9 ff ff       	jmp    101ea7 <__alltraps>

0010254b <vector172>:
.globl vector172
vector172:
  pushl $0
  10254b:	6a 00                	push   $0x0
  pushl $172
  10254d:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102552:	e9 50 f9 ff ff       	jmp    101ea7 <__alltraps>

00102557 <vector173>:
.globl vector173
vector173:
  pushl $0
  102557:	6a 00                	push   $0x0
  pushl $173
  102559:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10255e:	e9 44 f9 ff ff       	jmp    101ea7 <__alltraps>

00102563 <vector174>:
.globl vector174
vector174:
  pushl $0
  102563:	6a 00                	push   $0x0
  pushl $174
  102565:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  10256a:	e9 38 f9 ff ff       	jmp    101ea7 <__alltraps>

0010256f <vector175>:
.globl vector175
vector175:
  pushl $0
  10256f:	6a 00                	push   $0x0
  pushl $175
  102571:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102576:	e9 2c f9 ff ff       	jmp    101ea7 <__alltraps>

0010257b <vector176>:
.globl vector176
vector176:
  pushl $0
  10257b:	6a 00                	push   $0x0
  pushl $176
  10257d:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102582:	e9 20 f9 ff ff       	jmp    101ea7 <__alltraps>

00102587 <vector177>:
.globl vector177
vector177:
  pushl $0
  102587:	6a 00                	push   $0x0
  pushl $177
  102589:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  10258e:	e9 14 f9 ff ff       	jmp    101ea7 <__alltraps>

00102593 <vector178>:
.globl vector178
vector178:
  pushl $0
  102593:	6a 00                	push   $0x0
  pushl $178
  102595:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  10259a:	e9 08 f9 ff ff       	jmp    101ea7 <__alltraps>

0010259f <vector179>:
.globl vector179
vector179:
  pushl $0
  10259f:	6a 00                	push   $0x0
  pushl $179
  1025a1:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1025a6:	e9 fc f8 ff ff       	jmp    101ea7 <__alltraps>

001025ab <vector180>:
.globl vector180
vector180:
  pushl $0
  1025ab:	6a 00                	push   $0x0
  pushl $180
  1025ad:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1025b2:	e9 f0 f8 ff ff       	jmp    101ea7 <__alltraps>

001025b7 <vector181>:
.globl vector181
vector181:
  pushl $0
  1025b7:	6a 00                	push   $0x0
  pushl $181
  1025b9:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1025be:	e9 e4 f8 ff ff       	jmp    101ea7 <__alltraps>

001025c3 <vector182>:
.globl vector182
vector182:
  pushl $0
  1025c3:	6a 00                	push   $0x0
  pushl $182
  1025c5:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1025ca:	e9 d8 f8 ff ff       	jmp    101ea7 <__alltraps>

001025cf <vector183>:
.globl vector183
vector183:
  pushl $0
  1025cf:	6a 00                	push   $0x0
  pushl $183
  1025d1:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1025d6:	e9 cc f8 ff ff       	jmp    101ea7 <__alltraps>

001025db <vector184>:
.globl vector184
vector184:
  pushl $0
  1025db:	6a 00                	push   $0x0
  pushl $184
  1025dd:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1025e2:	e9 c0 f8 ff ff       	jmp    101ea7 <__alltraps>

001025e7 <vector185>:
.globl vector185
vector185:
  pushl $0
  1025e7:	6a 00                	push   $0x0
  pushl $185
  1025e9:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1025ee:	e9 b4 f8 ff ff       	jmp    101ea7 <__alltraps>

001025f3 <vector186>:
.globl vector186
vector186:
  pushl $0
  1025f3:	6a 00                	push   $0x0
  pushl $186
  1025f5:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1025fa:	e9 a8 f8 ff ff       	jmp    101ea7 <__alltraps>

001025ff <vector187>:
.globl vector187
vector187:
  pushl $0
  1025ff:	6a 00                	push   $0x0
  pushl $187
  102601:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102606:	e9 9c f8 ff ff       	jmp    101ea7 <__alltraps>

0010260b <vector188>:
.globl vector188
vector188:
  pushl $0
  10260b:	6a 00                	push   $0x0
  pushl $188
  10260d:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102612:	e9 90 f8 ff ff       	jmp    101ea7 <__alltraps>

00102617 <vector189>:
.globl vector189
vector189:
  pushl $0
  102617:	6a 00                	push   $0x0
  pushl $189
  102619:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  10261e:	e9 84 f8 ff ff       	jmp    101ea7 <__alltraps>

00102623 <vector190>:
.globl vector190
vector190:
  pushl $0
  102623:	6a 00                	push   $0x0
  pushl $190
  102625:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  10262a:	e9 78 f8 ff ff       	jmp    101ea7 <__alltraps>

0010262f <vector191>:
.globl vector191
vector191:
  pushl $0
  10262f:	6a 00                	push   $0x0
  pushl $191
  102631:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102636:	e9 6c f8 ff ff       	jmp    101ea7 <__alltraps>

0010263b <vector192>:
.globl vector192
vector192:
  pushl $0
  10263b:	6a 00                	push   $0x0
  pushl $192
  10263d:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102642:	e9 60 f8 ff ff       	jmp    101ea7 <__alltraps>

00102647 <vector193>:
.globl vector193
vector193:
  pushl $0
  102647:	6a 00                	push   $0x0
  pushl $193
  102649:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  10264e:	e9 54 f8 ff ff       	jmp    101ea7 <__alltraps>

00102653 <vector194>:
.globl vector194
vector194:
  pushl $0
  102653:	6a 00                	push   $0x0
  pushl $194
  102655:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  10265a:	e9 48 f8 ff ff       	jmp    101ea7 <__alltraps>

0010265f <vector195>:
.globl vector195
vector195:
  pushl $0
  10265f:	6a 00                	push   $0x0
  pushl $195
  102661:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102666:	e9 3c f8 ff ff       	jmp    101ea7 <__alltraps>

0010266b <vector196>:
.globl vector196
vector196:
  pushl $0
  10266b:	6a 00                	push   $0x0
  pushl $196
  10266d:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102672:	e9 30 f8 ff ff       	jmp    101ea7 <__alltraps>

00102677 <vector197>:
.globl vector197
vector197:
  pushl $0
  102677:	6a 00                	push   $0x0
  pushl $197
  102679:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  10267e:	e9 24 f8 ff ff       	jmp    101ea7 <__alltraps>

00102683 <vector198>:
.globl vector198
vector198:
  pushl $0
  102683:	6a 00                	push   $0x0
  pushl $198
  102685:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  10268a:	e9 18 f8 ff ff       	jmp    101ea7 <__alltraps>

0010268f <vector199>:
.globl vector199
vector199:
  pushl $0
  10268f:	6a 00                	push   $0x0
  pushl $199
  102691:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102696:	e9 0c f8 ff ff       	jmp    101ea7 <__alltraps>

0010269b <vector200>:
.globl vector200
vector200:
  pushl $0
  10269b:	6a 00                	push   $0x0
  pushl $200
  10269d:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  1026a2:	e9 00 f8 ff ff       	jmp    101ea7 <__alltraps>

001026a7 <vector201>:
.globl vector201
vector201:
  pushl $0
  1026a7:	6a 00                	push   $0x0
  pushl $201
  1026a9:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1026ae:	e9 f4 f7 ff ff       	jmp    101ea7 <__alltraps>

001026b3 <vector202>:
.globl vector202
vector202:
  pushl $0
  1026b3:	6a 00                	push   $0x0
  pushl $202
  1026b5:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1026ba:	e9 e8 f7 ff ff       	jmp    101ea7 <__alltraps>

001026bf <vector203>:
.globl vector203
vector203:
  pushl $0
  1026bf:	6a 00                	push   $0x0
  pushl $203
  1026c1:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1026c6:	e9 dc f7 ff ff       	jmp    101ea7 <__alltraps>

001026cb <vector204>:
.globl vector204
vector204:
  pushl $0
  1026cb:	6a 00                	push   $0x0
  pushl $204
  1026cd:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1026d2:	e9 d0 f7 ff ff       	jmp    101ea7 <__alltraps>

001026d7 <vector205>:
.globl vector205
vector205:
  pushl $0
  1026d7:	6a 00                	push   $0x0
  pushl $205
  1026d9:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1026de:	e9 c4 f7 ff ff       	jmp    101ea7 <__alltraps>

001026e3 <vector206>:
.globl vector206
vector206:
  pushl $0
  1026e3:	6a 00                	push   $0x0
  pushl $206
  1026e5:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1026ea:	e9 b8 f7 ff ff       	jmp    101ea7 <__alltraps>

001026ef <vector207>:
.globl vector207
vector207:
  pushl $0
  1026ef:	6a 00                	push   $0x0
  pushl $207
  1026f1:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1026f6:	e9 ac f7 ff ff       	jmp    101ea7 <__alltraps>

001026fb <vector208>:
.globl vector208
vector208:
  pushl $0
  1026fb:	6a 00                	push   $0x0
  pushl $208
  1026fd:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  102702:	e9 a0 f7 ff ff       	jmp    101ea7 <__alltraps>

00102707 <vector209>:
.globl vector209
vector209:
  pushl $0
  102707:	6a 00                	push   $0x0
  pushl $209
  102709:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  10270e:	e9 94 f7 ff ff       	jmp    101ea7 <__alltraps>

00102713 <vector210>:
.globl vector210
vector210:
  pushl $0
  102713:	6a 00                	push   $0x0
  pushl $210
  102715:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  10271a:	e9 88 f7 ff ff       	jmp    101ea7 <__alltraps>

0010271f <vector211>:
.globl vector211
vector211:
  pushl $0
  10271f:	6a 00                	push   $0x0
  pushl $211
  102721:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102726:	e9 7c f7 ff ff       	jmp    101ea7 <__alltraps>

0010272b <vector212>:
.globl vector212
vector212:
  pushl $0
  10272b:	6a 00                	push   $0x0
  pushl $212
  10272d:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102732:	e9 70 f7 ff ff       	jmp    101ea7 <__alltraps>

00102737 <vector213>:
.globl vector213
vector213:
  pushl $0
  102737:	6a 00                	push   $0x0
  pushl $213
  102739:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  10273e:	e9 64 f7 ff ff       	jmp    101ea7 <__alltraps>

00102743 <vector214>:
.globl vector214
vector214:
  pushl $0
  102743:	6a 00                	push   $0x0
  pushl $214
  102745:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  10274a:	e9 58 f7 ff ff       	jmp    101ea7 <__alltraps>

0010274f <vector215>:
.globl vector215
vector215:
  pushl $0
  10274f:	6a 00                	push   $0x0
  pushl $215
  102751:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102756:	e9 4c f7 ff ff       	jmp    101ea7 <__alltraps>

0010275b <vector216>:
.globl vector216
vector216:
  pushl $0
  10275b:	6a 00                	push   $0x0
  pushl $216
  10275d:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102762:	e9 40 f7 ff ff       	jmp    101ea7 <__alltraps>

00102767 <vector217>:
.globl vector217
vector217:
  pushl $0
  102767:	6a 00                	push   $0x0
  pushl $217
  102769:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  10276e:	e9 34 f7 ff ff       	jmp    101ea7 <__alltraps>

00102773 <vector218>:
.globl vector218
vector218:
  pushl $0
  102773:	6a 00                	push   $0x0
  pushl $218
  102775:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  10277a:	e9 28 f7 ff ff       	jmp    101ea7 <__alltraps>

0010277f <vector219>:
.globl vector219
vector219:
  pushl $0
  10277f:	6a 00                	push   $0x0
  pushl $219
  102781:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102786:	e9 1c f7 ff ff       	jmp    101ea7 <__alltraps>

0010278b <vector220>:
.globl vector220
vector220:
  pushl $0
  10278b:	6a 00                	push   $0x0
  pushl $220
  10278d:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102792:	e9 10 f7 ff ff       	jmp    101ea7 <__alltraps>

00102797 <vector221>:
.globl vector221
vector221:
  pushl $0
  102797:	6a 00                	push   $0x0
  pushl $221
  102799:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  10279e:	e9 04 f7 ff ff       	jmp    101ea7 <__alltraps>

001027a3 <vector222>:
.globl vector222
vector222:
  pushl $0
  1027a3:	6a 00                	push   $0x0
  pushl $222
  1027a5:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1027aa:	e9 f8 f6 ff ff       	jmp    101ea7 <__alltraps>

001027af <vector223>:
.globl vector223
vector223:
  pushl $0
  1027af:	6a 00                	push   $0x0
  pushl $223
  1027b1:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1027b6:	e9 ec f6 ff ff       	jmp    101ea7 <__alltraps>

001027bb <vector224>:
.globl vector224
vector224:
  pushl $0
  1027bb:	6a 00                	push   $0x0
  pushl $224
  1027bd:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1027c2:	e9 e0 f6 ff ff       	jmp    101ea7 <__alltraps>

001027c7 <vector225>:
.globl vector225
vector225:
  pushl $0
  1027c7:	6a 00                	push   $0x0
  pushl $225
  1027c9:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1027ce:	e9 d4 f6 ff ff       	jmp    101ea7 <__alltraps>

001027d3 <vector226>:
.globl vector226
vector226:
  pushl $0
  1027d3:	6a 00                	push   $0x0
  pushl $226
  1027d5:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1027da:	e9 c8 f6 ff ff       	jmp    101ea7 <__alltraps>

001027df <vector227>:
.globl vector227
vector227:
  pushl $0
  1027df:	6a 00                	push   $0x0
  pushl $227
  1027e1:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1027e6:	e9 bc f6 ff ff       	jmp    101ea7 <__alltraps>

001027eb <vector228>:
.globl vector228
vector228:
  pushl $0
  1027eb:	6a 00                	push   $0x0
  pushl $228
  1027ed:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1027f2:	e9 b0 f6 ff ff       	jmp    101ea7 <__alltraps>

001027f7 <vector229>:
.globl vector229
vector229:
  pushl $0
  1027f7:	6a 00                	push   $0x0
  pushl $229
  1027f9:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1027fe:	e9 a4 f6 ff ff       	jmp    101ea7 <__alltraps>

00102803 <vector230>:
.globl vector230
vector230:
  pushl $0
  102803:	6a 00                	push   $0x0
  pushl $230
  102805:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  10280a:	e9 98 f6 ff ff       	jmp    101ea7 <__alltraps>

0010280f <vector231>:
.globl vector231
vector231:
  pushl $0
  10280f:	6a 00                	push   $0x0
  pushl $231
  102811:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102816:	e9 8c f6 ff ff       	jmp    101ea7 <__alltraps>

0010281b <vector232>:
.globl vector232
vector232:
  pushl $0
  10281b:	6a 00                	push   $0x0
  pushl $232
  10281d:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102822:	e9 80 f6 ff ff       	jmp    101ea7 <__alltraps>

00102827 <vector233>:
.globl vector233
vector233:
  pushl $0
  102827:	6a 00                	push   $0x0
  pushl $233
  102829:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  10282e:	e9 74 f6 ff ff       	jmp    101ea7 <__alltraps>

00102833 <vector234>:
.globl vector234
vector234:
  pushl $0
  102833:	6a 00                	push   $0x0
  pushl $234
  102835:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  10283a:	e9 68 f6 ff ff       	jmp    101ea7 <__alltraps>

0010283f <vector235>:
.globl vector235
vector235:
  pushl $0
  10283f:	6a 00                	push   $0x0
  pushl $235
  102841:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102846:	e9 5c f6 ff ff       	jmp    101ea7 <__alltraps>

0010284b <vector236>:
.globl vector236
vector236:
  pushl $0
  10284b:	6a 00                	push   $0x0
  pushl $236
  10284d:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102852:	e9 50 f6 ff ff       	jmp    101ea7 <__alltraps>

00102857 <vector237>:
.globl vector237
vector237:
  pushl $0
  102857:	6a 00                	push   $0x0
  pushl $237
  102859:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  10285e:	e9 44 f6 ff ff       	jmp    101ea7 <__alltraps>

00102863 <vector238>:
.globl vector238
vector238:
  pushl $0
  102863:	6a 00                	push   $0x0
  pushl $238
  102865:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  10286a:	e9 38 f6 ff ff       	jmp    101ea7 <__alltraps>

0010286f <vector239>:
.globl vector239
vector239:
  pushl $0
  10286f:	6a 00                	push   $0x0
  pushl $239
  102871:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102876:	e9 2c f6 ff ff       	jmp    101ea7 <__alltraps>

0010287b <vector240>:
.globl vector240
vector240:
  pushl $0
  10287b:	6a 00                	push   $0x0
  pushl $240
  10287d:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102882:	e9 20 f6 ff ff       	jmp    101ea7 <__alltraps>

00102887 <vector241>:
.globl vector241
vector241:
  pushl $0
  102887:	6a 00                	push   $0x0
  pushl $241
  102889:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  10288e:	e9 14 f6 ff ff       	jmp    101ea7 <__alltraps>

00102893 <vector242>:
.globl vector242
vector242:
  pushl $0
  102893:	6a 00                	push   $0x0
  pushl $242
  102895:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  10289a:	e9 08 f6 ff ff       	jmp    101ea7 <__alltraps>

0010289f <vector243>:
.globl vector243
vector243:
  pushl $0
  10289f:	6a 00                	push   $0x0
  pushl $243
  1028a1:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1028a6:	e9 fc f5 ff ff       	jmp    101ea7 <__alltraps>

001028ab <vector244>:
.globl vector244
vector244:
  pushl $0
  1028ab:	6a 00                	push   $0x0
  pushl $244
  1028ad:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1028b2:	e9 f0 f5 ff ff       	jmp    101ea7 <__alltraps>

001028b7 <vector245>:
.globl vector245
vector245:
  pushl $0
  1028b7:	6a 00                	push   $0x0
  pushl $245
  1028b9:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1028be:	e9 e4 f5 ff ff       	jmp    101ea7 <__alltraps>

001028c3 <vector246>:
.globl vector246
vector246:
  pushl $0
  1028c3:	6a 00                	push   $0x0
  pushl $246
  1028c5:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1028ca:	e9 d8 f5 ff ff       	jmp    101ea7 <__alltraps>

001028cf <vector247>:
.globl vector247
vector247:
  pushl $0
  1028cf:	6a 00                	push   $0x0
  pushl $247
  1028d1:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1028d6:	e9 cc f5 ff ff       	jmp    101ea7 <__alltraps>

001028db <vector248>:
.globl vector248
vector248:
  pushl $0
  1028db:	6a 00                	push   $0x0
  pushl $248
  1028dd:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1028e2:	e9 c0 f5 ff ff       	jmp    101ea7 <__alltraps>

001028e7 <vector249>:
.globl vector249
vector249:
  pushl $0
  1028e7:	6a 00                	push   $0x0
  pushl $249
  1028e9:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1028ee:	e9 b4 f5 ff ff       	jmp    101ea7 <__alltraps>

001028f3 <vector250>:
.globl vector250
vector250:
  pushl $0
  1028f3:	6a 00                	push   $0x0
  pushl $250
  1028f5:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1028fa:	e9 a8 f5 ff ff       	jmp    101ea7 <__alltraps>

001028ff <vector251>:
.globl vector251
vector251:
  pushl $0
  1028ff:	6a 00                	push   $0x0
  pushl $251
  102901:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102906:	e9 9c f5 ff ff       	jmp    101ea7 <__alltraps>

0010290b <vector252>:
.globl vector252
vector252:
  pushl $0
  10290b:	6a 00                	push   $0x0
  pushl $252
  10290d:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102912:	e9 90 f5 ff ff       	jmp    101ea7 <__alltraps>

00102917 <vector253>:
.globl vector253
vector253:
  pushl $0
  102917:	6a 00                	push   $0x0
  pushl $253
  102919:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  10291e:	e9 84 f5 ff ff       	jmp    101ea7 <__alltraps>

00102923 <vector254>:
.globl vector254
vector254:
  pushl $0
  102923:	6a 00                	push   $0x0
  pushl $254
  102925:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  10292a:	e9 78 f5 ff ff       	jmp    101ea7 <__alltraps>

0010292f <vector255>:
.globl vector255
vector255:
  pushl $0
  10292f:	6a 00                	push   $0x0
  pushl $255
  102931:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102936:	e9 6c f5 ff ff       	jmp    101ea7 <__alltraps>

0010293b <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  10293b:	55                   	push   %ebp
  10293c:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  10293e:	8b 45 08             	mov    0x8(%ebp),%eax
  102941:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102944:	b8 23 00 00 00       	mov    $0x23,%eax
  102949:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  10294b:	b8 23 00 00 00       	mov    $0x23,%eax
  102950:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102952:	b8 10 00 00 00       	mov    $0x10,%eax
  102957:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102959:	b8 10 00 00 00       	mov    $0x10,%eax
  10295e:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102960:	b8 10 00 00 00       	mov    $0x10,%eax
  102965:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102967:	ea 6e 29 10 00 08 00 	ljmp   $0x8,$0x10296e
}
  10296e:	90                   	nop
  10296f:	5d                   	pop    %ebp
  102970:	c3                   	ret    

00102971 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102971:	55                   	push   %ebp
  102972:	89 e5                	mov    %esp,%ebp
  102974:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102977:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  10297c:	05 00 04 00 00       	add    $0x400,%eax
  102981:	a3 a4 0c 11 00       	mov    %eax,0x110ca4
    ts.ts_ss0 = KERNEL_DS;
  102986:	66 c7 05 a8 0c 11 00 	movw   $0x10,0x110ca8
  10298d:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  10298f:	66 c7 05 08 fa 10 00 	movw   $0x68,0x10fa08
  102996:	68 00 
  102998:	b8 a0 0c 11 00       	mov    $0x110ca0,%eax
  10299d:	0f b7 c0             	movzwl %ax,%eax
  1029a0:	66 a3 0a fa 10 00    	mov    %ax,0x10fa0a
  1029a6:	b8 a0 0c 11 00       	mov    $0x110ca0,%eax
  1029ab:	c1 e8 10             	shr    $0x10,%eax
  1029ae:	a2 0c fa 10 00       	mov    %al,0x10fa0c
  1029b3:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029ba:	24 f0                	and    $0xf0,%al
  1029bc:	0c 09                	or     $0x9,%al
  1029be:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029c3:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029ca:	0c 10                	or     $0x10,%al
  1029cc:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029d1:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029d8:	24 9f                	and    $0x9f,%al
  1029da:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029df:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029e6:	0c 80                	or     $0x80,%al
  1029e8:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029ed:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  1029f4:	24 f0                	and    $0xf0,%al
  1029f6:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  1029fb:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102a02:	24 ef                	and    $0xef,%al
  102a04:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a09:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102a10:	24 df                	and    $0xdf,%al
  102a12:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a17:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102a1e:	0c 40                	or     $0x40,%al
  102a20:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a25:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102a2c:	24 7f                	and    $0x7f,%al
  102a2e:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a33:	b8 a0 0c 11 00       	mov    $0x110ca0,%eax
  102a38:	c1 e8 18             	shr    $0x18,%eax
  102a3b:	a2 0f fa 10 00       	mov    %al,0x10fa0f
    gdt[SEG_TSS].sd_s = 0;
  102a40:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102a47:	24 ef                	and    $0xef,%al
  102a49:	a2 0d fa 10 00       	mov    %al,0x10fa0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102a4e:	c7 04 24 10 fa 10 00 	movl   $0x10fa10,(%esp)
  102a55:	e8 e1 fe ff ff       	call   10293b <lgdt>
  102a5a:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102a60:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102a64:	0f 00 d8             	ltr    %ax
}
  102a67:	90                   	nop

    // load the TSS
    ltr(GD_TSS);
}
  102a68:	90                   	nop
  102a69:	89 ec                	mov    %ebp,%esp
  102a6b:	5d                   	pop    %ebp
  102a6c:	c3                   	ret    

00102a6d <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102a6d:	55                   	push   %ebp
  102a6e:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102a70:	e8 fc fe ff ff       	call   102971 <gdt_init>
}
  102a75:	90                   	nop
  102a76:	5d                   	pop    %ebp
  102a77:	c3                   	ret    

00102a78 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102a78:	55                   	push   %ebp
  102a79:	89 e5                	mov    %esp,%ebp
  102a7b:	83 ec 58             	sub    $0x58,%esp
  102a7e:	8b 45 10             	mov    0x10(%ebp),%eax
  102a81:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102a84:	8b 45 14             	mov    0x14(%ebp),%eax
  102a87:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102a8a:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102a8d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102a90:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102a93:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102a96:	8b 45 18             	mov    0x18(%ebp),%eax
  102a99:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102a9c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102a9f:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102aa2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102aa5:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102aa8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102aab:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102aae:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102ab2:	74 1c                	je     102ad0 <printnum+0x58>
  102ab4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ab7:	ba 00 00 00 00       	mov    $0x0,%edx
  102abc:	f7 75 e4             	divl   -0x1c(%ebp)
  102abf:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102ac2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ac5:	ba 00 00 00 00       	mov    $0x0,%edx
  102aca:	f7 75 e4             	divl   -0x1c(%ebp)
  102acd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ad0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102ad3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ad6:	f7 75 e4             	divl   -0x1c(%ebp)
  102ad9:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102adc:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102adf:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102ae2:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102ae5:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102ae8:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102aeb:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102aee:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102af1:	8b 45 18             	mov    0x18(%ebp),%eax
  102af4:	ba 00 00 00 00       	mov    $0x0,%edx
  102af9:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  102afc:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  102aff:	19 d1                	sbb    %edx,%ecx
  102b01:	72 4c                	jb     102b4f <printnum+0xd7>
        printnum(putch, putdat, result, base, width - 1, padc);
  102b03:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102b06:	8d 50 ff             	lea    -0x1(%eax),%edx
  102b09:	8b 45 20             	mov    0x20(%ebp),%eax
  102b0c:	89 44 24 18          	mov    %eax,0x18(%esp)
  102b10:	89 54 24 14          	mov    %edx,0x14(%esp)
  102b14:	8b 45 18             	mov    0x18(%ebp),%eax
  102b17:	89 44 24 10          	mov    %eax,0x10(%esp)
  102b1b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102b1e:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102b21:	89 44 24 08          	mov    %eax,0x8(%esp)
  102b25:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102b29:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b2c:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b30:	8b 45 08             	mov    0x8(%ebp),%eax
  102b33:	89 04 24             	mov    %eax,(%esp)
  102b36:	e8 3d ff ff ff       	call   102a78 <printnum>
  102b3b:	eb 1b                	jmp    102b58 <printnum+0xe0>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102b3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b40:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b44:	8b 45 20             	mov    0x20(%ebp),%eax
  102b47:	89 04 24             	mov    %eax,(%esp)
  102b4a:	8b 45 08             	mov    0x8(%ebp),%eax
  102b4d:	ff d0                	call   *%eax
        while (-- width > 0)
  102b4f:	ff 4d 1c             	decl   0x1c(%ebp)
  102b52:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102b56:	7f e5                	jg     102b3d <printnum+0xc5>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102b58:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102b5b:	05 70 3d 10 00       	add    $0x103d70,%eax
  102b60:	0f b6 00             	movzbl (%eax),%eax
  102b63:	0f be c0             	movsbl %al,%eax
  102b66:	8b 55 0c             	mov    0xc(%ebp),%edx
  102b69:	89 54 24 04          	mov    %edx,0x4(%esp)
  102b6d:	89 04 24             	mov    %eax,(%esp)
  102b70:	8b 45 08             	mov    0x8(%ebp),%eax
  102b73:	ff d0                	call   *%eax
}
  102b75:	90                   	nop
  102b76:	89 ec                	mov    %ebp,%esp
  102b78:	5d                   	pop    %ebp
  102b79:	c3                   	ret    

00102b7a <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102b7a:	55                   	push   %ebp
  102b7b:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102b7d:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102b81:	7e 14                	jle    102b97 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102b83:	8b 45 08             	mov    0x8(%ebp),%eax
  102b86:	8b 00                	mov    (%eax),%eax
  102b88:	8d 48 08             	lea    0x8(%eax),%ecx
  102b8b:	8b 55 08             	mov    0x8(%ebp),%edx
  102b8e:	89 0a                	mov    %ecx,(%edx)
  102b90:	8b 50 04             	mov    0x4(%eax),%edx
  102b93:	8b 00                	mov    (%eax),%eax
  102b95:	eb 30                	jmp    102bc7 <getuint+0x4d>
    }
    else if (lflag) {
  102b97:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102b9b:	74 16                	je     102bb3 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102b9d:	8b 45 08             	mov    0x8(%ebp),%eax
  102ba0:	8b 00                	mov    (%eax),%eax
  102ba2:	8d 48 04             	lea    0x4(%eax),%ecx
  102ba5:	8b 55 08             	mov    0x8(%ebp),%edx
  102ba8:	89 0a                	mov    %ecx,(%edx)
  102baa:	8b 00                	mov    (%eax),%eax
  102bac:	ba 00 00 00 00       	mov    $0x0,%edx
  102bb1:	eb 14                	jmp    102bc7 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102bb3:	8b 45 08             	mov    0x8(%ebp),%eax
  102bb6:	8b 00                	mov    (%eax),%eax
  102bb8:	8d 48 04             	lea    0x4(%eax),%ecx
  102bbb:	8b 55 08             	mov    0x8(%ebp),%edx
  102bbe:	89 0a                	mov    %ecx,(%edx)
  102bc0:	8b 00                	mov    (%eax),%eax
  102bc2:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102bc7:	5d                   	pop    %ebp
  102bc8:	c3                   	ret    

00102bc9 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102bc9:	55                   	push   %ebp
  102bca:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102bcc:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102bd0:	7e 14                	jle    102be6 <getint+0x1d>
        return va_arg(*ap, long long);
  102bd2:	8b 45 08             	mov    0x8(%ebp),%eax
  102bd5:	8b 00                	mov    (%eax),%eax
  102bd7:	8d 48 08             	lea    0x8(%eax),%ecx
  102bda:	8b 55 08             	mov    0x8(%ebp),%edx
  102bdd:	89 0a                	mov    %ecx,(%edx)
  102bdf:	8b 50 04             	mov    0x4(%eax),%edx
  102be2:	8b 00                	mov    (%eax),%eax
  102be4:	eb 28                	jmp    102c0e <getint+0x45>
    }
    else if (lflag) {
  102be6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102bea:	74 12                	je     102bfe <getint+0x35>
        return va_arg(*ap, long);
  102bec:	8b 45 08             	mov    0x8(%ebp),%eax
  102bef:	8b 00                	mov    (%eax),%eax
  102bf1:	8d 48 04             	lea    0x4(%eax),%ecx
  102bf4:	8b 55 08             	mov    0x8(%ebp),%edx
  102bf7:	89 0a                	mov    %ecx,(%edx)
  102bf9:	8b 00                	mov    (%eax),%eax
  102bfb:	99                   	cltd   
  102bfc:	eb 10                	jmp    102c0e <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102bfe:	8b 45 08             	mov    0x8(%ebp),%eax
  102c01:	8b 00                	mov    (%eax),%eax
  102c03:	8d 48 04             	lea    0x4(%eax),%ecx
  102c06:	8b 55 08             	mov    0x8(%ebp),%edx
  102c09:	89 0a                	mov    %ecx,(%edx)
  102c0b:	8b 00                	mov    (%eax),%eax
  102c0d:	99                   	cltd   
    }
}
  102c0e:	5d                   	pop    %ebp
  102c0f:	c3                   	ret    

00102c10 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102c10:	55                   	push   %ebp
  102c11:	89 e5                	mov    %esp,%ebp
  102c13:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102c16:	8d 45 14             	lea    0x14(%ebp),%eax
  102c19:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102c1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c1f:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102c23:	8b 45 10             	mov    0x10(%ebp),%eax
  102c26:	89 44 24 08          	mov    %eax,0x8(%esp)
  102c2a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c2d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c31:	8b 45 08             	mov    0x8(%ebp),%eax
  102c34:	89 04 24             	mov    %eax,(%esp)
  102c37:	e8 05 00 00 00       	call   102c41 <vprintfmt>
    va_end(ap);
}
  102c3c:	90                   	nop
  102c3d:	89 ec                	mov    %ebp,%esp
  102c3f:	5d                   	pop    %ebp
  102c40:	c3                   	ret    

00102c41 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102c41:	55                   	push   %ebp
  102c42:	89 e5                	mov    %esp,%ebp
  102c44:	56                   	push   %esi
  102c45:	53                   	push   %ebx
  102c46:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102c49:	eb 17                	jmp    102c62 <vprintfmt+0x21>
            if (ch == '\0') {
  102c4b:	85 db                	test   %ebx,%ebx
  102c4d:	0f 84 bf 03 00 00    	je     103012 <vprintfmt+0x3d1>
                return;
            }
            putch(ch, putdat);
  102c53:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c56:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c5a:	89 1c 24             	mov    %ebx,(%esp)
  102c5d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c60:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102c62:	8b 45 10             	mov    0x10(%ebp),%eax
  102c65:	8d 50 01             	lea    0x1(%eax),%edx
  102c68:	89 55 10             	mov    %edx,0x10(%ebp)
  102c6b:	0f b6 00             	movzbl (%eax),%eax
  102c6e:	0f b6 d8             	movzbl %al,%ebx
  102c71:	83 fb 25             	cmp    $0x25,%ebx
  102c74:	75 d5                	jne    102c4b <vprintfmt+0xa>
        }

        // Process a %-escape sequence
        char padc = ' ';
  102c76:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102c7a:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102c81:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102c84:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102c87:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102c8e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102c91:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102c94:	8b 45 10             	mov    0x10(%ebp),%eax
  102c97:	8d 50 01             	lea    0x1(%eax),%edx
  102c9a:	89 55 10             	mov    %edx,0x10(%ebp)
  102c9d:	0f b6 00             	movzbl (%eax),%eax
  102ca0:	0f b6 d8             	movzbl %al,%ebx
  102ca3:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102ca6:	83 f8 55             	cmp    $0x55,%eax
  102ca9:	0f 87 37 03 00 00    	ja     102fe6 <vprintfmt+0x3a5>
  102caf:	8b 04 85 94 3d 10 00 	mov    0x103d94(,%eax,4),%eax
  102cb6:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102cb8:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102cbc:	eb d6                	jmp    102c94 <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102cbe:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102cc2:	eb d0                	jmp    102c94 <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102cc4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102ccb:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102cce:	89 d0                	mov    %edx,%eax
  102cd0:	c1 e0 02             	shl    $0x2,%eax
  102cd3:	01 d0                	add    %edx,%eax
  102cd5:	01 c0                	add    %eax,%eax
  102cd7:	01 d8                	add    %ebx,%eax
  102cd9:	83 e8 30             	sub    $0x30,%eax
  102cdc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102cdf:	8b 45 10             	mov    0x10(%ebp),%eax
  102ce2:	0f b6 00             	movzbl (%eax),%eax
  102ce5:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102ce8:	83 fb 2f             	cmp    $0x2f,%ebx
  102ceb:	7e 38                	jle    102d25 <vprintfmt+0xe4>
  102ced:	83 fb 39             	cmp    $0x39,%ebx
  102cf0:	7f 33                	jg     102d25 <vprintfmt+0xe4>
            for (precision = 0; ; ++ fmt) {
  102cf2:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
  102cf5:	eb d4                	jmp    102ccb <vprintfmt+0x8a>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  102cf7:	8b 45 14             	mov    0x14(%ebp),%eax
  102cfa:	8d 50 04             	lea    0x4(%eax),%edx
  102cfd:	89 55 14             	mov    %edx,0x14(%ebp)
  102d00:	8b 00                	mov    (%eax),%eax
  102d02:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102d05:	eb 1f                	jmp    102d26 <vprintfmt+0xe5>

        case '.':
            if (width < 0)
  102d07:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102d0b:	79 87                	jns    102c94 <vprintfmt+0x53>
                width = 0;
  102d0d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102d14:	e9 7b ff ff ff       	jmp    102c94 <vprintfmt+0x53>

        case '#':
            altflag = 1;
  102d19:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102d20:	e9 6f ff ff ff       	jmp    102c94 <vprintfmt+0x53>
            goto process_precision;
  102d25:	90                   	nop

        process_precision:
            if (width < 0)
  102d26:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102d2a:	0f 89 64 ff ff ff    	jns    102c94 <vprintfmt+0x53>
                width = precision, precision = -1;
  102d30:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102d33:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102d36:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102d3d:	e9 52 ff ff ff       	jmp    102c94 <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102d42:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  102d45:	e9 4a ff ff ff       	jmp    102c94 <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102d4a:	8b 45 14             	mov    0x14(%ebp),%eax
  102d4d:	8d 50 04             	lea    0x4(%eax),%edx
  102d50:	89 55 14             	mov    %edx,0x14(%ebp)
  102d53:	8b 00                	mov    (%eax),%eax
  102d55:	8b 55 0c             	mov    0xc(%ebp),%edx
  102d58:	89 54 24 04          	mov    %edx,0x4(%esp)
  102d5c:	89 04 24             	mov    %eax,(%esp)
  102d5f:	8b 45 08             	mov    0x8(%ebp),%eax
  102d62:	ff d0                	call   *%eax
            break;
  102d64:	e9 a4 02 00 00       	jmp    10300d <vprintfmt+0x3cc>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102d69:	8b 45 14             	mov    0x14(%ebp),%eax
  102d6c:	8d 50 04             	lea    0x4(%eax),%edx
  102d6f:	89 55 14             	mov    %edx,0x14(%ebp)
  102d72:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102d74:	85 db                	test   %ebx,%ebx
  102d76:	79 02                	jns    102d7a <vprintfmt+0x139>
                err = -err;
  102d78:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102d7a:	83 fb 06             	cmp    $0x6,%ebx
  102d7d:	7f 0b                	jg     102d8a <vprintfmt+0x149>
  102d7f:	8b 34 9d 54 3d 10 00 	mov    0x103d54(,%ebx,4),%esi
  102d86:	85 f6                	test   %esi,%esi
  102d88:	75 23                	jne    102dad <vprintfmt+0x16c>
                printfmt(putch, putdat, "error %d", err);
  102d8a:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102d8e:	c7 44 24 08 81 3d 10 	movl   $0x103d81,0x8(%esp)
  102d95:	00 
  102d96:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d99:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d9d:	8b 45 08             	mov    0x8(%ebp),%eax
  102da0:	89 04 24             	mov    %eax,(%esp)
  102da3:	e8 68 fe ff ff       	call   102c10 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102da8:	e9 60 02 00 00       	jmp    10300d <vprintfmt+0x3cc>
                printfmt(putch, putdat, "%s", p);
  102dad:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102db1:	c7 44 24 08 8a 3d 10 	movl   $0x103d8a,0x8(%esp)
  102db8:	00 
  102db9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dbc:	89 44 24 04          	mov    %eax,0x4(%esp)
  102dc0:	8b 45 08             	mov    0x8(%ebp),%eax
  102dc3:	89 04 24             	mov    %eax,(%esp)
  102dc6:	e8 45 fe ff ff       	call   102c10 <printfmt>
            break;
  102dcb:	e9 3d 02 00 00       	jmp    10300d <vprintfmt+0x3cc>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102dd0:	8b 45 14             	mov    0x14(%ebp),%eax
  102dd3:	8d 50 04             	lea    0x4(%eax),%edx
  102dd6:	89 55 14             	mov    %edx,0x14(%ebp)
  102dd9:	8b 30                	mov    (%eax),%esi
  102ddb:	85 f6                	test   %esi,%esi
  102ddd:	75 05                	jne    102de4 <vprintfmt+0x1a3>
                p = "(null)";
  102ddf:	be 8d 3d 10 00       	mov    $0x103d8d,%esi
            }
            if (width > 0 && padc != '-') {
  102de4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102de8:	7e 76                	jle    102e60 <vprintfmt+0x21f>
  102dea:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102dee:	74 70                	je     102e60 <vprintfmt+0x21f>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102df0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102df3:	89 44 24 04          	mov    %eax,0x4(%esp)
  102df7:	89 34 24             	mov    %esi,(%esp)
  102dfa:	e8 16 03 00 00       	call   103115 <strnlen>
  102dff:	89 c2                	mov    %eax,%edx
  102e01:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e04:	29 d0                	sub    %edx,%eax
  102e06:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102e09:	eb 16                	jmp    102e21 <vprintfmt+0x1e0>
                    putch(padc, putdat);
  102e0b:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102e0f:	8b 55 0c             	mov    0xc(%ebp),%edx
  102e12:	89 54 24 04          	mov    %edx,0x4(%esp)
  102e16:	89 04 24             	mov    %eax,(%esp)
  102e19:	8b 45 08             	mov    0x8(%ebp),%eax
  102e1c:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  102e1e:	ff 4d e8             	decl   -0x18(%ebp)
  102e21:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102e25:	7f e4                	jg     102e0b <vprintfmt+0x1ca>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102e27:	eb 37                	jmp    102e60 <vprintfmt+0x21f>
                if (altflag && (ch < ' ' || ch > '~')) {
  102e29:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102e2d:	74 1f                	je     102e4e <vprintfmt+0x20d>
  102e2f:	83 fb 1f             	cmp    $0x1f,%ebx
  102e32:	7e 05                	jle    102e39 <vprintfmt+0x1f8>
  102e34:	83 fb 7e             	cmp    $0x7e,%ebx
  102e37:	7e 15                	jle    102e4e <vprintfmt+0x20d>
                    putch('?', putdat);
  102e39:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e3c:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e40:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102e47:	8b 45 08             	mov    0x8(%ebp),%eax
  102e4a:	ff d0                	call   *%eax
  102e4c:	eb 0f                	jmp    102e5d <vprintfmt+0x21c>
                }
                else {
                    putch(ch, putdat);
  102e4e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e51:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e55:	89 1c 24             	mov    %ebx,(%esp)
  102e58:	8b 45 08             	mov    0x8(%ebp),%eax
  102e5b:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102e5d:	ff 4d e8             	decl   -0x18(%ebp)
  102e60:	89 f0                	mov    %esi,%eax
  102e62:	8d 70 01             	lea    0x1(%eax),%esi
  102e65:	0f b6 00             	movzbl (%eax),%eax
  102e68:	0f be d8             	movsbl %al,%ebx
  102e6b:	85 db                	test   %ebx,%ebx
  102e6d:	74 27                	je     102e96 <vprintfmt+0x255>
  102e6f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102e73:	78 b4                	js     102e29 <vprintfmt+0x1e8>
  102e75:	ff 4d e4             	decl   -0x1c(%ebp)
  102e78:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102e7c:	79 ab                	jns    102e29 <vprintfmt+0x1e8>
                }
            }
            for (; width > 0; width --) {
  102e7e:	eb 16                	jmp    102e96 <vprintfmt+0x255>
                putch(' ', putdat);
  102e80:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e83:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e87:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102e8e:	8b 45 08             	mov    0x8(%ebp),%eax
  102e91:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  102e93:	ff 4d e8             	decl   -0x18(%ebp)
  102e96:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102e9a:	7f e4                	jg     102e80 <vprintfmt+0x23f>
            }
            break;
  102e9c:	e9 6c 01 00 00       	jmp    10300d <vprintfmt+0x3cc>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102ea1:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102ea4:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ea8:	8d 45 14             	lea    0x14(%ebp),%eax
  102eab:	89 04 24             	mov    %eax,(%esp)
  102eae:	e8 16 fd ff ff       	call   102bc9 <getint>
  102eb3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102eb6:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102eb9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ebc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ebf:	85 d2                	test   %edx,%edx
  102ec1:	79 26                	jns    102ee9 <vprintfmt+0x2a8>
                putch('-', putdat);
  102ec3:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ec6:	89 44 24 04          	mov    %eax,0x4(%esp)
  102eca:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102ed1:	8b 45 08             	mov    0x8(%ebp),%eax
  102ed4:	ff d0                	call   *%eax
                num = -(long long)num;
  102ed6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ed9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102edc:	f7 d8                	neg    %eax
  102ede:	83 d2 00             	adc    $0x0,%edx
  102ee1:	f7 da                	neg    %edx
  102ee3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ee6:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102ee9:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102ef0:	e9 a8 00 00 00       	jmp    102f9d <vprintfmt+0x35c>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102ef5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102ef8:	89 44 24 04          	mov    %eax,0x4(%esp)
  102efc:	8d 45 14             	lea    0x14(%ebp),%eax
  102eff:	89 04 24             	mov    %eax,(%esp)
  102f02:	e8 73 fc ff ff       	call   102b7a <getuint>
  102f07:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f0a:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102f0d:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102f14:	e9 84 00 00 00       	jmp    102f9d <vprintfmt+0x35c>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102f19:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102f1c:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f20:	8d 45 14             	lea    0x14(%ebp),%eax
  102f23:	89 04 24             	mov    %eax,(%esp)
  102f26:	e8 4f fc ff ff       	call   102b7a <getuint>
  102f2b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f2e:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102f31:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102f38:	eb 63                	jmp    102f9d <vprintfmt+0x35c>

        // pointer
        case 'p':
            putch('0', putdat);
  102f3a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f3d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f41:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  102f48:	8b 45 08             	mov    0x8(%ebp),%eax
  102f4b:	ff d0                	call   *%eax
            putch('x', putdat);
  102f4d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f50:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f54:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  102f5b:	8b 45 08             	mov    0x8(%ebp),%eax
  102f5e:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  102f60:	8b 45 14             	mov    0x14(%ebp),%eax
  102f63:	8d 50 04             	lea    0x4(%eax),%edx
  102f66:	89 55 14             	mov    %edx,0x14(%ebp)
  102f69:	8b 00                	mov    (%eax),%eax
  102f6b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f6e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  102f75:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  102f7c:	eb 1f                	jmp    102f9d <vprintfmt+0x35c>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  102f7e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102f81:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f85:	8d 45 14             	lea    0x14(%ebp),%eax
  102f88:	89 04 24             	mov    %eax,(%esp)
  102f8b:	e8 ea fb ff ff       	call   102b7a <getuint>
  102f90:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f93:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  102f96:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  102f9d:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  102fa1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102fa4:	89 54 24 18          	mov    %edx,0x18(%esp)
  102fa8:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102fab:	89 54 24 14          	mov    %edx,0x14(%esp)
  102faf:	89 44 24 10          	mov    %eax,0x10(%esp)
  102fb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fb6:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102fb9:	89 44 24 08          	mov    %eax,0x8(%esp)
  102fbd:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102fc1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fc4:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fc8:	8b 45 08             	mov    0x8(%ebp),%eax
  102fcb:	89 04 24             	mov    %eax,(%esp)
  102fce:	e8 a5 fa ff ff       	call   102a78 <printnum>
            break;
  102fd3:	eb 38                	jmp    10300d <vprintfmt+0x3cc>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  102fd5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fd8:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fdc:	89 1c 24             	mov    %ebx,(%esp)
  102fdf:	8b 45 08             	mov    0x8(%ebp),%eax
  102fe2:	ff d0                	call   *%eax
            break;
  102fe4:	eb 27                	jmp    10300d <vprintfmt+0x3cc>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  102fe6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fe9:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fed:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  102ff4:	8b 45 08             	mov    0x8(%ebp),%eax
  102ff7:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  102ff9:	ff 4d 10             	decl   0x10(%ebp)
  102ffc:	eb 03                	jmp    103001 <vprintfmt+0x3c0>
  102ffe:	ff 4d 10             	decl   0x10(%ebp)
  103001:	8b 45 10             	mov    0x10(%ebp),%eax
  103004:	48                   	dec    %eax
  103005:	0f b6 00             	movzbl (%eax),%eax
  103008:	3c 25                	cmp    $0x25,%al
  10300a:	75 f2                	jne    102ffe <vprintfmt+0x3bd>
                /* do nothing */;
            break;
  10300c:	90                   	nop
    while (1) {
  10300d:	e9 37 fc ff ff       	jmp    102c49 <vprintfmt+0x8>
                return;
  103012:	90                   	nop
        }
    }
}
  103013:	83 c4 40             	add    $0x40,%esp
  103016:	5b                   	pop    %ebx
  103017:	5e                   	pop    %esi
  103018:	5d                   	pop    %ebp
  103019:	c3                   	ret    

0010301a <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  10301a:	55                   	push   %ebp
  10301b:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  10301d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103020:	8b 40 08             	mov    0x8(%eax),%eax
  103023:	8d 50 01             	lea    0x1(%eax),%edx
  103026:	8b 45 0c             	mov    0xc(%ebp),%eax
  103029:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  10302c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10302f:	8b 10                	mov    (%eax),%edx
  103031:	8b 45 0c             	mov    0xc(%ebp),%eax
  103034:	8b 40 04             	mov    0x4(%eax),%eax
  103037:	39 c2                	cmp    %eax,%edx
  103039:	73 12                	jae    10304d <sprintputch+0x33>
        *b->buf ++ = ch;
  10303b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10303e:	8b 00                	mov    (%eax),%eax
  103040:	8d 48 01             	lea    0x1(%eax),%ecx
  103043:	8b 55 0c             	mov    0xc(%ebp),%edx
  103046:	89 0a                	mov    %ecx,(%edx)
  103048:	8b 55 08             	mov    0x8(%ebp),%edx
  10304b:	88 10                	mov    %dl,(%eax)
    }
}
  10304d:	90                   	nop
  10304e:	5d                   	pop    %ebp
  10304f:	c3                   	ret    

00103050 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  103050:	55                   	push   %ebp
  103051:	89 e5                	mov    %esp,%ebp
  103053:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  103056:	8d 45 14             	lea    0x14(%ebp),%eax
  103059:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  10305c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10305f:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103063:	8b 45 10             	mov    0x10(%ebp),%eax
  103066:	89 44 24 08          	mov    %eax,0x8(%esp)
  10306a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10306d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103071:	8b 45 08             	mov    0x8(%ebp),%eax
  103074:	89 04 24             	mov    %eax,(%esp)
  103077:	e8 0a 00 00 00       	call   103086 <vsnprintf>
  10307c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10307f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103082:	89 ec                	mov    %ebp,%esp
  103084:	5d                   	pop    %ebp
  103085:	c3                   	ret    

00103086 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  103086:	55                   	push   %ebp
  103087:	89 e5                	mov    %esp,%ebp
  103089:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  10308c:	8b 45 08             	mov    0x8(%ebp),%eax
  10308f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103092:	8b 45 0c             	mov    0xc(%ebp),%eax
  103095:	8d 50 ff             	lea    -0x1(%eax),%edx
  103098:	8b 45 08             	mov    0x8(%ebp),%eax
  10309b:	01 d0                	add    %edx,%eax
  10309d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1030a0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  1030a7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1030ab:	74 0a                	je     1030b7 <vsnprintf+0x31>
  1030ad:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1030b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1030b3:	39 c2                	cmp    %eax,%edx
  1030b5:	76 07                	jbe    1030be <vsnprintf+0x38>
        return -E_INVAL;
  1030b7:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  1030bc:	eb 2a                	jmp    1030e8 <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  1030be:	8b 45 14             	mov    0x14(%ebp),%eax
  1030c1:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1030c5:	8b 45 10             	mov    0x10(%ebp),%eax
  1030c8:	89 44 24 08          	mov    %eax,0x8(%esp)
  1030cc:	8d 45 ec             	lea    -0x14(%ebp),%eax
  1030cf:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030d3:	c7 04 24 1a 30 10 00 	movl   $0x10301a,(%esp)
  1030da:	e8 62 fb ff ff       	call   102c41 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  1030df:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1030e2:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  1030e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1030e8:	89 ec                	mov    %ebp,%esp
  1030ea:	5d                   	pop    %ebp
  1030eb:	c3                   	ret    

001030ec <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  1030ec:	55                   	push   %ebp
  1030ed:	89 e5                	mov    %esp,%ebp
  1030ef:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  1030f2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  1030f9:	eb 03                	jmp    1030fe <strlen+0x12>
        cnt ++;
  1030fb:	ff 45 fc             	incl   -0x4(%ebp)
    while (*s ++ != '\0') {
  1030fe:	8b 45 08             	mov    0x8(%ebp),%eax
  103101:	8d 50 01             	lea    0x1(%eax),%edx
  103104:	89 55 08             	mov    %edx,0x8(%ebp)
  103107:	0f b6 00             	movzbl (%eax),%eax
  10310a:	84 c0                	test   %al,%al
  10310c:	75 ed                	jne    1030fb <strlen+0xf>
    }
    return cnt;
  10310e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  103111:	89 ec                	mov    %ebp,%esp
  103113:	5d                   	pop    %ebp
  103114:	c3                   	ret    

00103115 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  103115:	55                   	push   %ebp
  103116:	89 e5                	mov    %esp,%ebp
  103118:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  10311b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  103122:	eb 03                	jmp    103127 <strnlen+0x12>
        cnt ++;
  103124:	ff 45 fc             	incl   -0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  103127:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10312a:	3b 45 0c             	cmp    0xc(%ebp),%eax
  10312d:	73 10                	jae    10313f <strnlen+0x2a>
  10312f:	8b 45 08             	mov    0x8(%ebp),%eax
  103132:	8d 50 01             	lea    0x1(%eax),%edx
  103135:	89 55 08             	mov    %edx,0x8(%ebp)
  103138:	0f b6 00             	movzbl (%eax),%eax
  10313b:	84 c0                	test   %al,%al
  10313d:	75 e5                	jne    103124 <strnlen+0xf>
    }
    return cnt;
  10313f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  103142:	89 ec                	mov    %ebp,%esp
  103144:	5d                   	pop    %ebp
  103145:	c3                   	ret    

00103146 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  103146:	55                   	push   %ebp
  103147:	89 e5                	mov    %esp,%ebp
  103149:	57                   	push   %edi
  10314a:	56                   	push   %esi
  10314b:	83 ec 20             	sub    $0x20,%esp
  10314e:	8b 45 08             	mov    0x8(%ebp),%eax
  103151:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103154:	8b 45 0c             	mov    0xc(%ebp),%eax
  103157:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  10315a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10315d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103160:	89 d1                	mov    %edx,%ecx
  103162:	89 c2                	mov    %eax,%edx
  103164:	89 ce                	mov    %ecx,%esi
  103166:	89 d7                	mov    %edx,%edi
  103168:	ac                   	lods   %ds:(%esi),%al
  103169:	aa                   	stos   %al,%es:(%edi)
  10316a:	84 c0                	test   %al,%al
  10316c:	75 fa                	jne    103168 <strcpy+0x22>
  10316e:	89 fa                	mov    %edi,%edx
  103170:	89 f1                	mov    %esi,%ecx
  103172:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  103175:	89 55 e8             	mov    %edx,-0x18(%ebp)
  103178:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  10317b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  10317e:	83 c4 20             	add    $0x20,%esp
  103181:	5e                   	pop    %esi
  103182:	5f                   	pop    %edi
  103183:	5d                   	pop    %ebp
  103184:	c3                   	ret    

00103185 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  103185:	55                   	push   %ebp
  103186:	89 e5                	mov    %esp,%ebp
  103188:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  10318b:	8b 45 08             	mov    0x8(%ebp),%eax
  10318e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  103191:	eb 1e                	jmp    1031b1 <strncpy+0x2c>
        if ((*p = *src) != '\0') {
  103193:	8b 45 0c             	mov    0xc(%ebp),%eax
  103196:	0f b6 10             	movzbl (%eax),%edx
  103199:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10319c:	88 10                	mov    %dl,(%eax)
  10319e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1031a1:	0f b6 00             	movzbl (%eax),%eax
  1031a4:	84 c0                	test   %al,%al
  1031a6:	74 03                	je     1031ab <strncpy+0x26>
            src ++;
  1031a8:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  1031ab:	ff 45 fc             	incl   -0x4(%ebp)
  1031ae:	ff 4d 10             	decl   0x10(%ebp)
    while (len > 0) {
  1031b1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1031b5:	75 dc                	jne    103193 <strncpy+0xe>
    }
    return dst;
  1031b7:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1031ba:	89 ec                	mov    %ebp,%esp
  1031bc:	5d                   	pop    %ebp
  1031bd:	c3                   	ret    

001031be <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  1031be:	55                   	push   %ebp
  1031bf:	89 e5                	mov    %esp,%ebp
  1031c1:	57                   	push   %edi
  1031c2:	56                   	push   %esi
  1031c3:	83 ec 20             	sub    $0x20,%esp
  1031c6:	8b 45 08             	mov    0x8(%ebp),%eax
  1031c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1031cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031cf:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  1031d2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1031d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031d8:	89 d1                	mov    %edx,%ecx
  1031da:	89 c2                	mov    %eax,%edx
  1031dc:	89 ce                	mov    %ecx,%esi
  1031de:	89 d7                	mov    %edx,%edi
  1031e0:	ac                   	lods   %ds:(%esi),%al
  1031e1:	ae                   	scas   %es:(%edi),%al
  1031e2:	75 08                	jne    1031ec <strcmp+0x2e>
  1031e4:	84 c0                	test   %al,%al
  1031e6:	75 f8                	jne    1031e0 <strcmp+0x22>
  1031e8:	31 c0                	xor    %eax,%eax
  1031ea:	eb 04                	jmp    1031f0 <strcmp+0x32>
  1031ec:	19 c0                	sbb    %eax,%eax
  1031ee:	0c 01                	or     $0x1,%al
  1031f0:	89 fa                	mov    %edi,%edx
  1031f2:	89 f1                	mov    %esi,%ecx
  1031f4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1031f7:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  1031fa:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  1031fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  103200:	83 c4 20             	add    $0x20,%esp
  103203:	5e                   	pop    %esi
  103204:	5f                   	pop    %edi
  103205:	5d                   	pop    %ebp
  103206:	c3                   	ret    

00103207 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  103207:	55                   	push   %ebp
  103208:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  10320a:	eb 09                	jmp    103215 <strncmp+0xe>
        n --, s1 ++, s2 ++;
  10320c:	ff 4d 10             	decl   0x10(%ebp)
  10320f:	ff 45 08             	incl   0x8(%ebp)
  103212:	ff 45 0c             	incl   0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  103215:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103219:	74 1a                	je     103235 <strncmp+0x2e>
  10321b:	8b 45 08             	mov    0x8(%ebp),%eax
  10321e:	0f b6 00             	movzbl (%eax),%eax
  103221:	84 c0                	test   %al,%al
  103223:	74 10                	je     103235 <strncmp+0x2e>
  103225:	8b 45 08             	mov    0x8(%ebp),%eax
  103228:	0f b6 10             	movzbl (%eax),%edx
  10322b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10322e:	0f b6 00             	movzbl (%eax),%eax
  103231:	38 c2                	cmp    %al,%dl
  103233:	74 d7                	je     10320c <strncmp+0x5>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  103235:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103239:	74 18                	je     103253 <strncmp+0x4c>
  10323b:	8b 45 08             	mov    0x8(%ebp),%eax
  10323e:	0f b6 00             	movzbl (%eax),%eax
  103241:	0f b6 d0             	movzbl %al,%edx
  103244:	8b 45 0c             	mov    0xc(%ebp),%eax
  103247:	0f b6 00             	movzbl (%eax),%eax
  10324a:	0f b6 c8             	movzbl %al,%ecx
  10324d:	89 d0                	mov    %edx,%eax
  10324f:	29 c8                	sub    %ecx,%eax
  103251:	eb 05                	jmp    103258 <strncmp+0x51>
  103253:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103258:	5d                   	pop    %ebp
  103259:	c3                   	ret    

0010325a <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  10325a:	55                   	push   %ebp
  10325b:	89 e5                	mov    %esp,%ebp
  10325d:	83 ec 04             	sub    $0x4,%esp
  103260:	8b 45 0c             	mov    0xc(%ebp),%eax
  103263:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  103266:	eb 13                	jmp    10327b <strchr+0x21>
        if (*s == c) {
  103268:	8b 45 08             	mov    0x8(%ebp),%eax
  10326b:	0f b6 00             	movzbl (%eax),%eax
  10326e:	38 45 fc             	cmp    %al,-0x4(%ebp)
  103271:	75 05                	jne    103278 <strchr+0x1e>
            return (char *)s;
  103273:	8b 45 08             	mov    0x8(%ebp),%eax
  103276:	eb 12                	jmp    10328a <strchr+0x30>
        }
        s ++;
  103278:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  10327b:	8b 45 08             	mov    0x8(%ebp),%eax
  10327e:	0f b6 00             	movzbl (%eax),%eax
  103281:	84 c0                	test   %al,%al
  103283:	75 e3                	jne    103268 <strchr+0xe>
    }
    return NULL;
  103285:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10328a:	89 ec                	mov    %ebp,%esp
  10328c:	5d                   	pop    %ebp
  10328d:	c3                   	ret    

0010328e <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  10328e:	55                   	push   %ebp
  10328f:	89 e5                	mov    %esp,%ebp
  103291:	83 ec 04             	sub    $0x4,%esp
  103294:	8b 45 0c             	mov    0xc(%ebp),%eax
  103297:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  10329a:	eb 0e                	jmp    1032aa <strfind+0x1c>
        if (*s == c) {
  10329c:	8b 45 08             	mov    0x8(%ebp),%eax
  10329f:	0f b6 00             	movzbl (%eax),%eax
  1032a2:	38 45 fc             	cmp    %al,-0x4(%ebp)
  1032a5:	74 0f                	je     1032b6 <strfind+0x28>
            break;
        }
        s ++;
  1032a7:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  1032aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1032ad:	0f b6 00             	movzbl (%eax),%eax
  1032b0:	84 c0                	test   %al,%al
  1032b2:	75 e8                	jne    10329c <strfind+0xe>
  1032b4:	eb 01                	jmp    1032b7 <strfind+0x29>
            break;
  1032b6:	90                   	nop
    }
    return (char *)s;
  1032b7:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1032ba:	89 ec                	mov    %ebp,%esp
  1032bc:	5d                   	pop    %ebp
  1032bd:	c3                   	ret    

001032be <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  1032be:	55                   	push   %ebp
  1032bf:	89 e5                	mov    %esp,%ebp
  1032c1:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  1032c4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  1032cb:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  1032d2:	eb 03                	jmp    1032d7 <strtol+0x19>
        s ++;
  1032d4:	ff 45 08             	incl   0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  1032d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1032da:	0f b6 00             	movzbl (%eax),%eax
  1032dd:	3c 20                	cmp    $0x20,%al
  1032df:	74 f3                	je     1032d4 <strtol+0x16>
  1032e1:	8b 45 08             	mov    0x8(%ebp),%eax
  1032e4:	0f b6 00             	movzbl (%eax),%eax
  1032e7:	3c 09                	cmp    $0x9,%al
  1032e9:	74 e9                	je     1032d4 <strtol+0x16>
    }

    // plus/minus sign
    if (*s == '+') {
  1032eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1032ee:	0f b6 00             	movzbl (%eax),%eax
  1032f1:	3c 2b                	cmp    $0x2b,%al
  1032f3:	75 05                	jne    1032fa <strtol+0x3c>
        s ++;
  1032f5:	ff 45 08             	incl   0x8(%ebp)
  1032f8:	eb 14                	jmp    10330e <strtol+0x50>
    }
    else if (*s == '-') {
  1032fa:	8b 45 08             	mov    0x8(%ebp),%eax
  1032fd:	0f b6 00             	movzbl (%eax),%eax
  103300:	3c 2d                	cmp    $0x2d,%al
  103302:	75 0a                	jne    10330e <strtol+0x50>
        s ++, neg = 1;
  103304:	ff 45 08             	incl   0x8(%ebp)
  103307:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  10330e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103312:	74 06                	je     10331a <strtol+0x5c>
  103314:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  103318:	75 22                	jne    10333c <strtol+0x7e>
  10331a:	8b 45 08             	mov    0x8(%ebp),%eax
  10331d:	0f b6 00             	movzbl (%eax),%eax
  103320:	3c 30                	cmp    $0x30,%al
  103322:	75 18                	jne    10333c <strtol+0x7e>
  103324:	8b 45 08             	mov    0x8(%ebp),%eax
  103327:	40                   	inc    %eax
  103328:	0f b6 00             	movzbl (%eax),%eax
  10332b:	3c 78                	cmp    $0x78,%al
  10332d:	75 0d                	jne    10333c <strtol+0x7e>
        s += 2, base = 16;
  10332f:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  103333:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  10333a:	eb 29                	jmp    103365 <strtol+0xa7>
    }
    else if (base == 0 && s[0] == '0') {
  10333c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103340:	75 16                	jne    103358 <strtol+0x9a>
  103342:	8b 45 08             	mov    0x8(%ebp),%eax
  103345:	0f b6 00             	movzbl (%eax),%eax
  103348:	3c 30                	cmp    $0x30,%al
  10334a:	75 0c                	jne    103358 <strtol+0x9a>
        s ++, base = 8;
  10334c:	ff 45 08             	incl   0x8(%ebp)
  10334f:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  103356:	eb 0d                	jmp    103365 <strtol+0xa7>
    }
    else if (base == 0) {
  103358:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10335c:	75 07                	jne    103365 <strtol+0xa7>
        base = 10;
  10335e:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  103365:	8b 45 08             	mov    0x8(%ebp),%eax
  103368:	0f b6 00             	movzbl (%eax),%eax
  10336b:	3c 2f                	cmp    $0x2f,%al
  10336d:	7e 1b                	jle    10338a <strtol+0xcc>
  10336f:	8b 45 08             	mov    0x8(%ebp),%eax
  103372:	0f b6 00             	movzbl (%eax),%eax
  103375:	3c 39                	cmp    $0x39,%al
  103377:	7f 11                	jg     10338a <strtol+0xcc>
            dig = *s - '0';
  103379:	8b 45 08             	mov    0x8(%ebp),%eax
  10337c:	0f b6 00             	movzbl (%eax),%eax
  10337f:	0f be c0             	movsbl %al,%eax
  103382:	83 e8 30             	sub    $0x30,%eax
  103385:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103388:	eb 48                	jmp    1033d2 <strtol+0x114>
        }
        else if (*s >= 'a' && *s <= 'z') {
  10338a:	8b 45 08             	mov    0x8(%ebp),%eax
  10338d:	0f b6 00             	movzbl (%eax),%eax
  103390:	3c 60                	cmp    $0x60,%al
  103392:	7e 1b                	jle    1033af <strtol+0xf1>
  103394:	8b 45 08             	mov    0x8(%ebp),%eax
  103397:	0f b6 00             	movzbl (%eax),%eax
  10339a:	3c 7a                	cmp    $0x7a,%al
  10339c:	7f 11                	jg     1033af <strtol+0xf1>
            dig = *s - 'a' + 10;
  10339e:	8b 45 08             	mov    0x8(%ebp),%eax
  1033a1:	0f b6 00             	movzbl (%eax),%eax
  1033a4:	0f be c0             	movsbl %al,%eax
  1033a7:	83 e8 57             	sub    $0x57,%eax
  1033aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1033ad:	eb 23                	jmp    1033d2 <strtol+0x114>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  1033af:	8b 45 08             	mov    0x8(%ebp),%eax
  1033b2:	0f b6 00             	movzbl (%eax),%eax
  1033b5:	3c 40                	cmp    $0x40,%al
  1033b7:	7e 3b                	jle    1033f4 <strtol+0x136>
  1033b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1033bc:	0f b6 00             	movzbl (%eax),%eax
  1033bf:	3c 5a                	cmp    $0x5a,%al
  1033c1:	7f 31                	jg     1033f4 <strtol+0x136>
            dig = *s - 'A' + 10;
  1033c3:	8b 45 08             	mov    0x8(%ebp),%eax
  1033c6:	0f b6 00             	movzbl (%eax),%eax
  1033c9:	0f be c0             	movsbl %al,%eax
  1033cc:	83 e8 37             	sub    $0x37,%eax
  1033cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  1033d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1033d5:	3b 45 10             	cmp    0x10(%ebp),%eax
  1033d8:	7d 19                	jge    1033f3 <strtol+0x135>
            break;
        }
        s ++, val = (val * base) + dig;
  1033da:	ff 45 08             	incl   0x8(%ebp)
  1033dd:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1033e0:	0f af 45 10          	imul   0x10(%ebp),%eax
  1033e4:	89 c2                	mov    %eax,%edx
  1033e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1033e9:	01 d0                	add    %edx,%eax
  1033eb:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  1033ee:	e9 72 ff ff ff       	jmp    103365 <strtol+0xa7>
            break;
  1033f3:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  1033f4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1033f8:	74 08                	je     103402 <strtol+0x144>
        *endptr = (char *) s;
  1033fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033fd:	8b 55 08             	mov    0x8(%ebp),%edx
  103400:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  103402:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  103406:	74 07                	je     10340f <strtol+0x151>
  103408:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10340b:	f7 d8                	neg    %eax
  10340d:	eb 03                	jmp    103412 <strtol+0x154>
  10340f:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  103412:	89 ec                	mov    %ebp,%esp
  103414:	5d                   	pop    %ebp
  103415:	c3                   	ret    

00103416 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  103416:	55                   	push   %ebp
  103417:	89 e5                	mov    %esp,%ebp
  103419:	83 ec 28             	sub    $0x28,%esp
  10341c:	89 7d fc             	mov    %edi,-0x4(%ebp)
  10341f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103422:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  103425:	0f be 55 d8          	movsbl -0x28(%ebp),%edx
  103429:	8b 45 08             	mov    0x8(%ebp),%eax
  10342c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10342f:	88 55 f7             	mov    %dl,-0x9(%ebp)
  103432:	8b 45 10             	mov    0x10(%ebp),%eax
  103435:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  103438:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  10343b:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  10343f:	8b 55 f8             	mov    -0x8(%ebp),%edx
  103442:	89 d7                	mov    %edx,%edi
  103444:	f3 aa                	rep stos %al,%es:(%edi)
  103446:	89 fa                	mov    %edi,%edx
  103448:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  10344b:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  10344e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  103451:	8b 7d fc             	mov    -0x4(%ebp),%edi
  103454:	89 ec                	mov    %ebp,%esp
  103456:	5d                   	pop    %ebp
  103457:	c3                   	ret    

00103458 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  103458:	55                   	push   %ebp
  103459:	89 e5                	mov    %esp,%ebp
  10345b:	57                   	push   %edi
  10345c:	56                   	push   %esi
  10345d:	53                   	push   %ebx
  10345e:	83 ec 30             	sub    $0x30,%esp
  103461:	8b 45 08             	mov    0x8(%ebp),%eax
  103464:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103467:	8b 45 0c             	mov    0xc(%ebp),%eax
  10346a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10346d:	8b 45 10             	mov    0x10(%ebp),%eax
  103470:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  103473:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103476:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  103479:	73 42                	jae    1034bd <memmove+0x65>
  10347b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10347e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  103481:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103484:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103487:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10348a:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  10348d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103490:	c1 e8 02             	shr    $0x2,%eax
  103493:	89 c1                	mov    %eax,%ecx
    asm volatile (
  103495:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103498:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10349b:	89 d7                	mov    %edx,%edi
  10349d:	89 c6                	mov    %eax,%esi
  10349f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1034a1:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  1034a4:	83 e1 03             	and    $0x3,%ecx
  1034a7:	74 02                	je     1034ab <memmove+0x53>
  1034a9:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1034ab:	89 f0                	mov    %esi,%eax
  1034ad:	89 fa                	mov    %edi,%edx
  1034af:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  1034b2:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  1034b5:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  1034b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  1034bb:	eb 36                	jmp    1034f3 <memmove+0x9b>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  1034bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1034c0:	8d 50 ff             	lea    -0x1(%eax),%edx
  1034c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1034c6:	01 c2                	add    %eax,%edx
  1034c8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1034cb:	8d 48 ff             	lea    -0x1(%eax),%ecx
  1034ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1034d1:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  1034d4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1034d7:	89 c1                	mov    %eax,%ecx
  1034d9:	89 d8                	mov    %ebx,%eax
  1034db:	89 d6                	mov    %edx,%esi
  1034dd:	89 c7                	mov    %eax,%edi
  1034df:	fd                   	std    
  1034e0:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1034e2:	fc                   	cld    
  1034e3:	89 f8                	mov    %edi,%eax
  1034e5:	89 f2                	mov    %esi,%edx
  1034e7:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  1034ea:	89 55 c8             	mov    %edx,-0x38(%ebp)
  1034ed:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  1034f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  1034f3:	83 c4 30             	add    $0x30,%esp
  1034f6:	5b                   	pop    %ebx
  1034f7:	5e                   	pop    %esi
  1034f8:	5f                   	pop    %edi
  1034f9:	5d                   	pop    %ebp
  1034fa:	c3                   	ret    

001034fb <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  1034fb:	55                   	push   %ebp
  1034fc:	89 e5                	mov    %esp,%ebp
  1034fe:	57                   	push   %edi
  1034ff:	56                   	push   %esi
  103500:	83 ec 20             	sub    $0x20,%esp
  103503:	8b 45 08             	mov    0x8(%ebp),%eax
  103506:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103509:	8b 45 0c             	mov    0xc(%ebp),%eax
  10350c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10350f:	8b 45 10             	mov    0x10(%ebp),%eax
  103512:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103515:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103518:	c1 e8 02             	shr    $0x2,%eax
  10351b:	89 c1                	mov    %eax,%ecx
    asm volatile (
  10351d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103520:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103523:	89 d7                	mov    %edx,%edi
  103525:	89 c6                	mov    %eax,%esi
  103527:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103529:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  10352c:	83 e1 03             	and    $0x3,%ecx
  10352f:	74 02                	je     103533 <memcpy+0x38>
  103531:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103533:	89 f0                	mov    %esi,%eax
  103535:	89 fa                	mov    %edi,%edx
  103537:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  10353a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  10353d:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  103540:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  103543:	83 c4 20             	add    $0x20,%esp
  103546:	5e                   	pop    %esi
  103547:	5f                   	pop    %edi
  103548:	5d                   	pop    %ebp
  103549:	c3                   	ret    

0010354a <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  10354a:	55                   	push   %ebp
  10354b:	89 e5                	mov    %esp,%ebp
  10354d:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  103550:	8b 45 08             	mov    0x8(%ebp),%eax
  103553:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  103556:	8b 45 0c             	mov    0xc(%ebp),%eax
  103559:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  10355c:	eb 2e                	jmp    10358c <memcmp+0x42>
        if (*s1 != *s2) {
  10355e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103561:	0f b6 10             	movzbl (%eax),%edx
  103564:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103567:	0f b6 00             	movzbl (%eax),%eax
  10356a:	38 c2                	cmp    %al,%dl
  10356c:	74 18                	je     103586 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  10356e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103571:	0f b6 00             	movzbl (%eax),%eax
  103574:	0f b6 d0             	movzbl %al,%edx
  103577:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10357a:	0f b6 00             	movzbl (%eax),%eax
  10357d:	0f b6 c8             	movzbl %al,%ecx
  103580:	89 d0                	mov    %edx,%eax
  103582:	29 c8                	sub    %ecx,%eax
  103584:	eb 18                	jmp    10359e <memcmp+0x54>
        }
        s1 ++, s2 ++;
  103586:	ff 45 fc             	incl   -0x4(%ebp)
  103589:	ff 45 f8             	incl   -0x8(%ebp)
    while (n -- > 0) {
  10358c:	8b 45 10             	mov    0x10(%ebp),%eax
  10358f:	8d 50 ff             	lea    -0x1(%eax),%edx
  103592:	89 55 10             	mov    %edx,0x10(%ebp)
  103595:	85 c0                	test   %eax,%eax
  103597:	75 c5                	jne    10355e <memcmp+0x14>
    }
    return 0;
  103599:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10359e:	89 ec                	mov    %ebp,%esp
  1035a0:	5d                   	pop    %ebp
  1035a1:	c3                   	ret    
