import time
import wandb


def init_wandb_parser(parser):
    parser.add_argument('--wandb', action='store_true',
                        help="use wandb or not")
    parser.add_argument('--wandb_project_name', type=str, default='PL-cross',
                        help="项目名称")
    parser.add_argument('--wandb_work_name', type=str, default='ner',
                        help="当前任务名称")


class MyWandb:
    def __init__(self, args):
        self.args = args
        self.wandb = wandb.init(entity='homuraT', project=args.wandb_project_name, name=args.wandb_work_name)
        for k, v in args.__dict__.items():
            self.wandb.config[k] = v

    def finish(self):
        self.wandb.finish()

    def log(self, data:dict):
        self.wandb.log(data)


myWandb: MyWandb = None


def get_wandb(args=None):
    global myWandb
    if args is not None:
        assert args, 'wandb 在创建时必须有 args'
        myWandb = MyWandb(args)

    return myWandb


def close_wandb():
    global myWandb
    if myWandb:
        myWandb.finish()
        myWandb = None


def wandb_log(data:dict):
    global myWandb
    if myWandb:
        myWandb.log(data)


def wandb_finish():
    global myWandb
    if myWandb:
        myWandb.finish()
