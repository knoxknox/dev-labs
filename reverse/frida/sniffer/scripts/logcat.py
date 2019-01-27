import re
import sys

COLOR_RST = '\33[0m'
COLOR_GRAY = '\33[90m'
COLOR_GREEN = '\33[32m'
COLOR_YELLOW = '\33[33m'

##
# Sample:
# sending rest-client request:  (chunk 1 of 4): LookoutRestRequest Body
# sending rest-client request:  (chunk 2 of 4): NextChunkForPreviousRequest
# received rest-client response:  (chunk 1 of 3): LookoutRestResponse Body
# received rest-client response:  (chunk 2 of 3): NextChunkForPreviousResponse
#
regexp = re.compile('.*(?P<type>request|response).*\(chunk (?P<chunk>\d of \d)\):(?P<text>.*)')

buf = []
while True:
  try:
    line = sys.stdin.readline()
  except KeyboardInterrupt:
    break # stops on ctrl+c interrupt

  if len(line) == 0: continue
  row = re.match(regexp, line)

  if row is None: continue
  row_values = row.groupdict()

  type = row_values['type']
  text = row_values['text'].strip()
  chunks = map(lambda x: int(x), row_values['chunk'].split(' of '))

  buf.append(text)
  if chunks[0] == chunks[1]:
    output_line = ''.join(buf)

    buf = []
    if output_line.startswith('LookoutRestRequest'):
      output_line = output_line[len('LookoutRestRequest') + 1:]
      print '{1}Request:\n{2}{0}\n'.format(output_line, COLOR_GREEN, COLOR_RST)
    if output_line.startswith('LookoutRestResponse'):
      output_line = output_line[len('LookoutRestResponse') + 1:]
      print '{2}Response:\n{1}{0}{3}\n'.format(output_line, COLOR_GRAY, COLOR_YELLOW, COLOR_RST)
