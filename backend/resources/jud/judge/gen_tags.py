import os
from pathlib import Path
import sys
sys.path.append("..")
from log import Log
from util_html import get_content,parse_html,create_tokenizer
logger = Log()
tokenizer = create_tokenizer("../keywords.json")
def gen_tags_file(base_path):
    seen_content = set()
    htmls = Path(base_path).rglob('*.html')
    htmls = [x for x in htmls]
    print(f'htmls: {len(htmls)} files')
    for html in htmls:
        tags_file_path = html.with_suffix('.tags')
        if Path(tags_file_path).exists():
            continue
        result = parse_html(tokenizer,html)
        out_string = '\n'.join([str(x) for x in result ])
        seen_content.add(out_string)
        if len(result) < 50:
            logger.warning(f'too short {len(result)}')
            continue
        with open(tags_file_path,'w') as fout:
            fout.write(out_string)
            print(f"finish {tags_file_path}")
    logger.warning(f'totol htmls {len(htmls)} tags {len(seen_content)}')
    return 

if __name__ == '__main__':
    gen_tags_file('/home/miniwmy/samples/benign_sample/alexa')
    gen_tags_file('/home/miniwmy/samples/benign_sample/corner_case')
    gen_tags_file('/home/miniwmy/samples/groundtruth/bocai')
    gen_tags_file('/home/miniwmy/samples/groundtruth/maochong')
    gen_tags_file('/home/miniwmy/samples/groundtruth/daikuan')
    gen_tags_file('/home/miniwmy/samples/groundtruth/licai')
    gen_tags_file('/home/miniwmy/samples/groundtruth/zhibojian')
    gen_tags_file('/home/miniwmy/samples/groundtruth/uncategory')
