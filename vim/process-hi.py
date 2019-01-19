# processes output from :redir > hi-output :hi :redir END
# makes it into a .vim with highlight presets
# you must hand-join the lines that got clipped for being too long in hi-output

with open("hi-output", mode='r') as hi:
    statements = hi.readlines()

out_lines = list()
for line in statements:
    if 'links to' not in line and 'cleared' not in line:
        out_line = line.replace(' xxx', '')
        out_line = ' '.join(out_line.split())
        out_line = f'hi {out_line}'
        out_lines.append(out_line)

with open('hi-presets.vim', 'w') as out_f:
    out_f.write('\n'.join(out_lines))

# done.
