import unittest
# 如果沒裝 flask，這行在 build 過程中的 RUN 指令就會報錯
from app import app 

class SimpleTest(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()

    def test_status(self):
        rv = self.app.get('/')
        self.assertEqual(rv.status_code, 200)

if __name__ == '__main__':
    unittest.main()