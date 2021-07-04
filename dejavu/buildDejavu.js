function buildDejaVu(...args) {
    prog = [...args].map(arg => {
      return [
        arg.length,
        ... arg.split('').map(c => c.charCodeAt(0))
      ];
    }).reduce((a, b) => [...a, ...b], []).map(i => {
      return 'Deja. Vu. '.repeat(i) + 'Deja. Vu? ';
    });
    prog.push('Deja? Vu. '.repeat(prog.length));
    return prog.join('') + 'Deja? Vu?';
}

console.log(buildDejaVu('/usr/sbin/setcap', 'cap_dac_override+eip', '/bin/busybox'));
