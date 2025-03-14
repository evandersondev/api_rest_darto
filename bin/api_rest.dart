import 'package:api_rest/database/database.dart';
import 'package:api_rest/router.dart';
import 'package:darto/darto.dart';

void main() async {
  Database.instance.init();
  final app = Darto();

  app.use(createRoutes());

  app.get('/ping', (req, res) {
    res.json({'message': 'pong'});
  });

  app.listen(8080, () {
    print('Server is running on port 8080');
  });
}
