import 'package:basic_utils/basic_utils.dart';
import 'package:basic_utils/src/model/DnsApiProvider.dart';
import 'package:basic_utils/src/model/RRecordType.dart';
import 'package:test/test.dart';

void main() {
  test('Test lookupRecord', () async {
    var records = await DnsUtils.lookupRecord('google.de', RRecordType.A);
    expect(records.elementAt(0).data.isEmpty, false);
    expect(records.elementAt(0).rType, 1);
  });

  test('Test lookupRecord Cloudflare', () async {
    var records = await DnsUtils.lookupRecord('google.de', RRecordType.A,
        provider: DnsApiProvider.CLOUDFLARE);
    expect(records.elementAt(0).data.isEmpty, false);
    expect(records.elementAt(0).rType, 1);
  });
}
