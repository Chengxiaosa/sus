import os

alexa_ids = []
corner_ids = []
bocai_ids = [10483210,10483498,10790700,10907913,10483021,10804593,9481707,10777981,9746566,9963060,10496926,10475103,10773420,10710124,9863077,8924191,10868695,10817727,10500097,10447844,8810971,10673207,10507598,10874335,10795901,10091929,10332420,9945875,10975380,10275188,10792994,9334294,10749171,10793343,10984491,10193322,9635110]
maochong_ids = []
daikuan_ids = []
licai_ids = []
zhibojian_ids = []
uncategory_ids = []

def put_ids(ids, path):
    for cid in ids:
        cmd = 'cp /home/syang/seaweedfs/data/mount/work_of_scam/webpage/{}/screenshot.png /home/miniwmy/samples/{}/{}.png'.format(cid, path, cid)
        os.system(cmd)
        cmd = 'cp /home/syang/seaweedfs/data/mount/work_of_scam/webpage/{}/page.html /home/miniwmy/samples/{}/{}.html'.format(cid, path, cid)
        os.system(cmd)
        print('put',cid)
    print('put',len(ids),path)
put_ids(alexa_ids,'benign_sample/alexa')
put_ids(corner_ids,'benign_sample/corner_case')
put_ids(bocai_ids, 'groundtruth/bocai')
put_ids(maochong_ids, 'groundtruth/maochong')
put_ids(daikuan_ids, 'groundtruth/daikuan')
put_ids(licai_ids, 'groundtruth/licai')
put_ids(zhibojian_ids, 'groundtruth/zhibojian')
put_ids(uncategory_ids, 'groundtruth/uncategory')
