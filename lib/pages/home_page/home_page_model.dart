import '/backend/api_requests/api_calls.dart';
import '/component/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  DateTime? dateSelected;

  dynamic menuPinned;

  dynamic menuPinnedDescription;

  ///  State fields for stateful widgets in this page.

  // Model for Navbar component.
  late NavbarModel navbarModel;

  /// Query cache managers for this widget.

  final _menuListCahceManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> menuListCahce({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _menuListCahceManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMenuListCahceCache() => _menuListCahceManager.clear();
  void clearMenuListCahceCacheKey(String? uniqueKey) =>
      _menuListCahceManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();

    /// Dispose query cache managers for this widget.

    clearMenuListCahceCache();
  }
}
