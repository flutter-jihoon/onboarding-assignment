### Flutter팀 온보딩 과제

1. TMDB api 사용
    1. https://developer.themoviedb.org/reference/movie-now-playing-list - 현재 상영중인 영화 리스트
    2. https://developer.themoviedb.org/reference/genre-movie-list - 영화 장르 리스트
    3. https://developer.themoviedb.org/reference/discover-movie - 영화 리스트 (with_genres 쿼리 파라미터 사용)
2. [Bloc](https://pub.dev/packages/flutter_bloc) 사용, [dio](https://pub.dev/packages/dio) 사용, [freezed](https://pub.dev/packages/freezed) 사용
3. 홈 화면, 장르별 영화 리스트 화면 구현하기
4. 홈 화면은 현재 상영중인 영화 리스트와 장르별 영화 리스트를 vertical 방식의 스크롤뷰로 구성한다
5. 현재 상영중인 영화 리스트는 페이지 스와이프 방식으로 구현한다 
6. 현재 상영중인 영화 리스트의 각 페이지는 영화 이미지, 평점, 제목, 설명을 보여준다
7. 현재 상영중인 영화 리스트는 하단에 인디케이터로 현재 페이지의 순서를 보여준다
8. 각 장르별 영화 리스트는 장르, 전체보기 버튼, 각 장르에 해당하는 영화 리스트를 보여준다
9. 영화 리스트는 horizontal 방식의 스크롤뷰로 구성한다
10. 전체보기 버튼을 클릭했을 때, 장르별 영화 리스트 화면으로 이동한다
11. 장르별 영화 리스트 화면은 infinite scroll로 구현하고, 각 영화는 그리드 방식의 스크롤뷰로 구성한다